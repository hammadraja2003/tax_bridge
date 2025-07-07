<?php

namespace App\Http\Controllers;

use App\Models\Buyer;
use Illuminate\Http\Request;

class BuyerController extends Controller
{
    public function index()
    {
        $buyers = Buyer::latest()->paginate(10);
        return view('buyers.index', compact('buyers'));
    }

    public function create()
    {
        return view('buyers.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'byr_name' => 'required|string|max:255',
            'byr_type' => 'required|integer',
            'byr_ntn_cnic' => 'nullable|string|max:255',
            'byr_address' => 'nullable|string',
            'byr_account_number' => 'nullable|string|max:255',
            'byr_reg_num' => 'nullable|string|max:255',
            'byr_contact_num' => 'nullable|string|max:20',
            'byr_contact_person' => 'nullable|string|max:255',
            'byr_IBAN' => 'nullable|string|max:255',
            'byr_swift_code' => 'nullable|string|max:255',
            'byr_acc_branch_name' => 'nullable|string|max:255',
            'byr_acc_branch_code' => 'nullable|string|max:255',
            'byr_logo' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048', // ← this line added
        ]);


        $data = $request->all();

        if ($request->hasFile('byr_logo')) {
            $file = $request->file('byr_logo');
            $filename = time() . '_' . preg_replace('/\s+/', '_', $file->getClientOriginalName());
            $file->storeAs('public/buyers', $filename);
            $data['byr_logo'] = $filename;
        }

        Buyer::create($data);

        return redirect()->route('buyers.index')->with('success', 'Buyer created successfully.');
    }

    public function edit($id)
    {
        $buyer = Buyer::findOrFail($id);
        return view('buyers.edit', compact('buyer'));
    }

    public function update(Request $request, $id)
    {
        $request->validate([
            'byr_name' => 'required|string|max:255',
            'byr_type' => 'required|integer',
            'byr_ntn_cnic' => 'nullable|string|max:255',
            'byr_address' => 'nullable|string',
            'byr_account_number' => 'nullable|string|max:255',
            'byr_reg_num' => 'nullable|string|max:255',
            'byr_contact_num' => 'nullable|string|max:20',
            'byr_contact_person' => 'nullable|string|max:255',
            'byr_IBAN' => 'nullable|string|max:255',
            'byr_swift_code' => 'nullable|string|max:255',
            'byr_acc_branch_name' => 'nullable|string|max:255',
            'byr_acc_branch_code' => 'nullable|string|max:255',
            'byr_logo' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);

        $buyer = Buyer::findOrFail($id); // ← required line

        $data = $request->all();

        if ($request->hasFile('byr_logo')) {
            $file = $request->file('byr_logo');
            $filename = time() . '_' . preg_replace('/\s+/', '_', $file->getClientOriginalName());
            $file->storeAs('public/buyers', $filename);
            $data['byr_logo'] = $filename;
        }

        $buyer->update($data);

        return redirect()->route('buyers.index')->with('success', 'Buyer updated successfully.');
    }


    public function delete($id)
    {
        $buyer = Buyer::findOrFail($id);
        $buyer->delete();

        return redirect()->route('buyers.index')->with('success', 'Buyer deleted successfully.');
    }
}