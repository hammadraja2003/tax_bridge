<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\BusinessConfiguration;

class CompanyController extends Controller
{
    public function index()
    {
        $config = BusinessConfiguration::first(); // Only one config expected
        return view('company.configuration', compact('config'));
    }
    // public function storeOrUpdate(Request $request)
    // {
    //     $config = BusinessConfiguration::first();
    //     $request->validate([
    //         'id_type' => 'required|in:NTN,CNIC',
    //         'bus_ntn_cnic' => [
    //             'required',
    //             function ($attribute, $value, $fail) use ($request) {
    //                 if ($request->id_type === 'NTN' && !preg_match('/^[0-9]{7}$/', $value)) {
    //                     $fail('NTN must be exactly 7 digits.');
    //                 }
    //                 if ($request->id_type === 'CNIC' && !preg_match('/^[0-9]{13}$/', $value)) {
    //                     $fail('CNIC must be exactly 13 digits (without dashes).');
    //                 }
    //             }
    //         ],
    //         'bus_name' => 'required|string|max:255',
    //         'bus_ntn_cnic' => 'required|string|max:255',
    //         'bus_account_title' => 'nullable|string|max:255',
    //         'bus_account_number' => 'nullable|string|max:255',
    //         'bus_reg_num' => 'nullable|string|max:255',
    //         'bus_contact_num' => 'nullable|string|max:20',
    //         'bus_contact_person' => 'nullable|string|max:255',
    //         'bus_IBAN' => 'nullable|string|max:255',
    //         'bus_acc_branch_name' => 'nullable|string|max:255',
    //         'bus_acc_branch_code' => 'nullable|string|max:255',
    //         'bus_logo' => $config && $config->bus_logo ? 'nullable|mimes:jpg,jpeg,png,svg|max:2048' : 'required|mimes:jpg,jpeg,png,svg|max:2048'

    //     ]);
    //     $data = $request->all();

    //     // Upload logo if provided (move to /uploads/company/)
    //     if ($request->hasFile('bus_logo')) {
    //         $file = $request->file('bus_logo');
    //         $extension = $file->getClientOriginalExtension();
    //         $filename = time() . '.' . $extension;
    //         $file->move(public_path('uploads/company'), $filename);
    //         $data['bus_logo'] = $filename;
    //     }
    //     $config = BusinessConfiguration::first();
    //     if ($config) {
    //         $config->update($data);
    //         $msg = 'Company configuration updated.';
    //     } else {
    //         BusinessConfiguration::create($data);
    //         $msg = 'Company configuration saved.';
    //     }
    //     return redirect()->route('company.configuration')->with('message', $msg);
    // }
    public function storeOrUpdate(Request $request)
    {
        DB::beginTransaction();
        try {
            $config = BusinessConfiguration::first();

            $request->validate([
                'id_type' => 'required|in:NTN,CNIC',
                'bus_ntn_cnic' => [
                    'required',
                    function ($attribute, $value, $fail) use ($request) {
                        if ($request->id_type === 'NTN' && !preg_match('/^[0-9]{7}$/', $value)) {
                            $fail('NTN must be exactly 7 digits.');
                        }
                        if ($request->id_type === 'CNIC' && !preg_match('/^[0-9]{13}$/', $value)) {
                            $fail('CNIC must be exactly 13 digits (without dashes).');
                        }
                    }
                ],
                'bus_name' => 'required|string|max:255',
                'bus_account_title' => 'nullable|string|max:255',
                'bus_account_number' => 'nullable|string|max:255',
                'bus_reg_num' => 'nullable|string|max:255',
                'bus_contact_num' => 'nullable|string|max:20',
                'bus_contact_person' => 'nullable|string|max:255',
                'bus_IBAN' => 'nullable|string|max:255',
                'bus_acc_branch_name' => 'nullable|string|max:255',
                'bus_acc_branch_code' => 'nullable|string|max:255',
                'bus_logo' => $config && $config->bus_logo
                    ? 'nullable|mimes:jpg,jpeg,png,svg|max:2048'
                    : 'required|mimes:jpg,jpeg,png,svg|max:2048'
            ]);

            $data = $request->all();

            // Upload logo if provided
            if ($request->hasFile('bus_logo')) {
                $file = $request->file('bus_logo');
                $extension = $file->getClientOriginalExtension();
                $filename = time() . '.' . $extension;
                $file->move(public_path('uploads/company'), $filename);
                $data['bus_logo'] = $filename;
            }

            if ($config) {
                // Keep old data for logging
                $oldData = $config->toArray();

                $config->update($data);

                // ✅ Log activity for update
                logActivity(
                    'update',
                    'Updated company configuration',
                    ['old' => $oldData, 'new' => $config->toArray()],
                    $config->id,
                    'business_configurations'
                );

                $msg = 'Company configuration updated.';
            } else {
                $config = BusinessConfiguration::create($data);

                // ✅ Log activity for create
                logActivity(
                    'add',
                    'Added new company configuration',
                    $config->toArray(),
                    $config->id,
                    'business_configurations'
                );

                $msg = 'Company configuration saved.';
            }

            DB::commit();

            return redirect()->route('company.configuration')->with('message', $msg);
        } catch (\Illuminate\Validation\ValidationException $e) {
            DB::rollBack();
            return redirect()->back()->withErrors($e->errors())->withInput();
        } catch (\Exception $e) {
            DB::rollBack();
            dd($e->getMessage(), $e->getFile(), $e->getLine());
        }
    }
}