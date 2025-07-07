<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\BusinessConfiguration;

class CompanyController extends Controller
{
    public function index()
    {
        $config = BusinessConfiguration::first(); // Only one config expected
        return view('company.configuration', compact('config'));
    }

    public function storeOrUpdate(Request $request)
    {
        $request->validate([
            'bus_name' => 'required|string|max:255',
            'bus_ntn_cnic' => 'required|string|max:255',
            'bus_address' => 'required|string',
            'bus_account_number' => 'nullable|string|max:255',
            'bus_reg_num' => 'nullable|string|max:255',
            'bus_contact_num' => 'nullable|string|max:20',
            'bus_contact_person' => 'nullable|string|max:255',
            'bus_IBAN' => 'nullable|string|max:255',
            'bus_swift_code' => 'nullable|string|max:255',
            'bus_acc_branch_name' => 'nullable|string|max:255',
            'bus_acc_branch_code' => 'nullable|string|max:255',
            'bus_logo' => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
        ]);

        $data = $request->all();

        // Upload logo if provided
        if ($request->hasFile('bus_logo')) {
            $file = $request->file('bus_logo');
            $filename = time() . '_' . $file->getClientOriginalName();
            $file->storeAs('public/company', $filename);
            $data['bus_logo'] = $filename;
        }

        $config = BusinessConfiguration::first();

        if ($config) {
            $config->update($data);
            $msg = 'Company configuration updated.';
        } else {
            BusinessConfiguration::create($data);
            $msg = 'Company configuration saved.';
        }

        return redirect()->route('company.configuration')->with('success', $msg);
    }
}