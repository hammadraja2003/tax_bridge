<?php

namespace App\Http\Controllers;

use App\Models\Buyer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;

class BuyerController extends Controller
{
    public function index(Request $request)
    {
        $query = Buyer::query();
        // Filter by buyer type
        if ($request->has('byr_type') && !empty($request->byr_type)) {
            $query->where('byr_type', $request->byr_type);
        }
        // Text search on multiple columns
        if ($request->filled('search')) {
            $search = $request->search;
            $query->where(function ($q) use ($search) {
                $q->where('byr_name', 'like', "%$search%")
                    ->orWhere('byr_ntn_cnic', 'like', "%$search%")
                    ->orWhere('byr_address', 'like', "%$search%");
            });
        }
        $buyers = $query->latest()->paginate(10)->appends($request->query());

        return view('buyers.index', compact('buyers'));
    }

    public function filter(Request $request)
    {
        session([
            'buyers_filters' => [
                'byr_type' => $request->byr_type,
                'search' => $request->search,
            ]
        ]);

        return redirect()->route('buyers.index');
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
            'byr_province' => 'nullable|string',
            'byr_account_title' => 'nullable|string|max:255',
            'byr_account_number' => 'nullable|string|max:255',
            'byr_reg_num' => 'nullable|string|max:255',
            'byr_contact_num' => 'nullable|string|max:20',
            'byr_contact_person' => 'nullable|string|max:255',
            'byr_IBAN' => 'nullable|string|max:255',
            'byr_acc_branch_name' => 'nullable|string|max:255',
            'byr_acc_branch_code' => 'nullable|string|max:255',
            'byr_logo' => 'nullable|mimes:jpg,jpeg,png,svg|max:2048',
        ]);
        $data = $request->all();
        if ($request->hasFile('byr_logo')) {
            $file = $request->file('byr_logo');
            $extension = $file->getClientOriginalExtension();
            $filename = time() . '.' . $extension;
            $file->move('uploads/buyer_images/', $filename);
            $data['byr_logo'] = $filename;
        }
        Buyer::create($data);
        return redirect()->route('buyers.index')->with('message', 'Client created successfully.');
    }
    public function edit($id)
    {
        $decryptedId = Crypt::decryptString($id);
        $buyer = Buyer::findOrFail($decryptedId);
        return view('buyers.edit', compact('buyer'));
    }
    public function update(Request $request, $id)
    {
        $request->validate([
            'byr_name' => 'required|string|max:255',
            'byr_type' => 'required|integer',
            'byr_ntn_cnic' => 'nullable|string|max:255',
            'byr_address' => 'nullable|string',
            'byr_province' => 'nullable|string',
            'byr_account_number' => 'nullable|string|max:255',
            'byr_reg_num' => 'nullable|string|max:255',
            'byr_contact_num' => 'nullable|string|max:20',
            'byr_contact_person' => 'nullable|string|max:255',
            'byr_IBAN' => 'nullable|string|max:255',
            'byr_acc_branch_name' => 'nullable|string|max:255',
            'byr_acc_branch_code' => 'nullable|string|max:255',
            'byr_logo' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
        ]);
        $buyer = Buyer::findOrFail($id);
        $data = $request->except('byr_logo');
        // Handle logo update
        if ($request->hasFile('byr_logo')) {
            // Delete old logo if exists
            if ($buyer->byr_logo && file_exists(public_path('uploads/buyer_images/' . $buyer->byr_logo))) {
                unlink(public_path('uploads/buyer_images/' . $buyer->byr_logo));
            }
            // Save new logo
            $file = $request->file('byr_logo');
            $extension = $file->getClientOriginalExtension();
            $filename = time() . '.' . $extension;
            $file->move(public_path('uploads/buyer_images/'), $filename);
            $data['byr_logo'] = $filename;
        }
        $buyer->update($data);
        return redirect()->route('buyers.index')->with('message', 'Client updated successfully.');
    }
    public function delete($id)
    {
        $buyer = Buyer::findOrFail($id);
        $buyer->delete();
        return redirect()->route('buyers.index')->with('message', 'Client deleted successfully.');
    }
}