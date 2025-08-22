<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;
use Illuminate\Support\Facades\Log;

class FbrInvoiceService
{
    protected string $env; // sandbox or production
    protected string $token;
    protected string $baseUrl;

    public function __construct(string $env = 'sandbox')
    {
        $this->env = $env;
        $this->baseUrl = 'https://gw.fbr.gov.pk/di_data/v1/di/';

        // if ($env === 'sandbox') {
        //     $this->token = env('FBR_API_TOKEN_SANDBOX');
        // } else {
        //     $this->token = env('FBR_API_TOKEN_PROD');
        // }
        if ($this->env === 'production') {
            $this->token = env('FBR_API_TOKEN_PROD');
        } else {
            $this->token = env('FBR_API_TOKEN_SANDBOX');
            $this->env = 'sandbox';
        }
    }
    public function validateInvoice(array $payload): array
    {
        try {
            $url = $this->baseUrl . ($this->env === 'production' ? 'validateinvoicedata' : 'validateinvoicedata_sb');

            $jsonData = json_encode($payload);

            $curl = curl_init();
            curl_setopt_array($curl, array(
                CURLOPT_URL =>  $url,
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => '',
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 0,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => 'POST',
                CURLOPT_POSTFIELDS => $jsonData,
                CURLOPT_HTTPHEADER => array(
                    'Authorization: Bearer ' . $this->token,
                    'Content-Type: application/json'
                ),
            ));

            $response = curl_exec($curl);

            curl_close($curl);
            $data = json_decode($response, true);

            // Access top-level values
            $dated = $data['dated'];
            $statusCode = $data['validationResponse']['statusCode'];
            $status = $data['validationResponse']['status'];
            $errorCode = $data['validationResponse']['errorCode'];
            $error = $data['validationResponse']['error'];
            $invoiceStatuses = $data['validationResponse']['invoiceStatuses'];

            return [
                'success' => $statusCode === '00'
                    && $status === 'Valid',
                'dated' => $dated,
                'data' => $data,
                'statusCode' => $statusCode,
                'status' => $status,
                'errorCode' => $errorCode,
                'error' => $error ?? 'Unknown error',
                'invoiceStatuses' => $invoiceStatuses ?? ''
            ];
        } catch (\Exception $e) {
            Log::error('Invoice Posting Failed: ' . $e->getMessage());
            return [
                'success' => false,
                'error' => $e->getMessage(),
            ];
        }
    }
    public function postInvoice(array $payload): array
    {
        try {
            $url = $this->baseUrl . ($this->env === 'production' ? 'postinvoicedata' : 'postinvoicedata_sb');
            $jsonData = json_encode($payload);

            $curl = curl_init();
            curl_setopt_array($curl, array(
                CURLOPT_URL =>  $url,
                CURLOPT_RETURNTRANSFER => true,
                CURLOPT_ENCODING => '',
                CURLOPT_MAXREDIRS => 10,
                CURLOPT_TIMEOUT => 0,
                CURLOPT_FOLLOWLOCATION => true,
                CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
                CURLOPT_CUSTOMREQUEST => 'POST',
                CURLOPT_POSTFIELDS => $jsonData,
                CURLOPT_HTTPHEADER => array(
                    'Authorization: Bearer ' . $this->token,
                    'Content-Type: application/json'
                ),
            ));

            $response = curl_exec($curl);

            curl_close($curl);
            $data = json_decode($response, true);

            // Access top-level values
            $dated = $data['dated'];
            $invoiceNumber = $data['invoiceNumber'];
            $statusCode = $data['validationResponse']['statusCode'];
            $status = $data['validationResponse']['status'];
            // $errorCode = $data['validationResponse']['errorCode'];
            $error = $data['validationResponse']['error'];
            $invoiceStatuses = $data['validationResponse']['invoiceStatuses'];

            return [
                'success' => $statusCode === '00'
                    && $status === 'Valid'
                    && isset($invoiceNumber),
                'data' => $data,
                'error' => $error ?? 'Unknown error',
                'invoiceStatuses' => $invoiceStatuses ?? ''
            ];
        } catch (\Exception $e) {
            Log::error('Invoice Posting Failed: ' . $e->getMessage());
            return [
                'success' => false,
                'error' => $e->getMessage(),
            ];
        }
    }
    protected function headers(): array
    {
        return [
            'Authorization' => 'Bearer ' . $this->token,
            'Content-Type' => 'application/json',
        ];
    }
}