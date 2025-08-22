<?php

namespace App\Http\Controllers;

use App\Models\Buyer;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\DB;

class BuyerController extends Controller
{
    public function index(Request $request)
    {
        $query = Buyer::query();

        // 🔎 Filter by Client Type
        if ($request->filled('byr_type')) {
            $query->where('byr_type', $request->byr_type);
        }

        // 🔎 Search filter (name, CNIC, address, etc.)
        if ($request->filled('search')) {
            $search = $request->search;
            $query->where(function ($q) use ($search) {
                $q->where('byr_name', 'like', "%{$search}%")
                    ->orWhere('byr_ntn_cnic', 'like', "%{$search}%")
                    ->orWhere('byr_address', 'like', "%{$search}%");
            });
        }

        // ✅ Now apply filters
        $buyers = $query->latest()->paginate(3);

        // 🔐 Tampering check
        foreach ($buyers as $buyer) {
            $calculatedHash = $buyer->generateHash();
            $buyer->tampered = $calculatedHash !== $buyer->hash;
        }

        return view('buyers.index', compact('buyers'));
    }

    // public function filter(Request $request)
    // {
    //     session([
    //         'buyers_filters' => [
    //             'byr_type' => $request->byr_type,
    //             'search' => $request->search,
    //         ]
    //     ]);
    //     return redirect()->route('buyers.index');
    // }
    public function fetch($id)
    {
        return response()->json(Buyer::findOrFail($id));
    }
    public function create()
    {
        return view('buyers.create');
    }
    public function store(Request $request)
    {
        DB::beginTransaction();
        try {
            $validated = $request->validate([
                'byr_name' => 'required|string|max:255',
                'byr_type' => 'required|integer',
                'byr_id_type' => [
                    'nullable',
                    'required_if:byr_type,1',
                    'in:NTN,CNIC'
                ],
                'byr_ntn_cnic' => [
                    'nullable',
                    'required_if:byr_type,1',
                    function ($attribute, $value, $fail) use ($request) {
                        if ($request->byr_id_type === 'NTN' && !preg_match('/^[0-9]{7}$/', $value)) {
                            $fail('Buyer NTN must be exactly 7 digits.');
                        }
                        if ($request->byr_id_type === 'CNIC' && !preg_match('/^[0-9]{13}$/', $value)) {
                            $fail('Buyer CNIC must be exactly 13 digits (without dashes).');
                        }
                    }
                ],
                'byr_address' => 'required|string',
                'byr_province' => 'required|string',
                'byr_account_title' => 'required|string|max:255',
                'byr_account_number' => 'required|string|max:255',
                'byr_reg_num' => 'required|string|max:255',
                'byr_contact_num' => 'required|string|max:20',
                'byr_contact_person' => 'required|string|max:255',
                'byr_IBAN' => 'required|string|max:255',
                'byr_acc_branch_name' => 'required|string|max:255',
                'byr_acc_branch_code' => 'required|string|max:255',
                'byr_logo' => 'required|mimes:jpg,jpeg,png,svg|max:2048',
            ]);
            if ($request->hasFile('byr_logo')) {
                $file = $request->file('byr_logo');
                $extension = $file->getClientOriginalExtension();
                $filename = time() . '.' . $extension;
                $file->move(public_path('uploads/buyer_images'), $filename);
                $validated['byr_logo'] = $filename;
            }
            $buyer = Buyer::create($validated);
            // ✅ Log activity
            logActivity(
                'add',
                'Added new client: ' . $buyer->byr_name,
                $buyer->toArray(),
                $buyer->id,
                'buyers'
            );
            DB::commit();
            return redirect()->route('buyers.index')
                ->with('message', 'Client created successfully.');
        } catch (\Illuminate\Validation\ValidationException $e) {
            DB::rollBack();
            return redirect()->back()->withErrors($e->errors())->withInput();
        } catch (\Exception $e) {
            DB::rollBack();
            dd($e->getMessage(), $e->getFile(), $e->getLine());
        }
    }
    public function edit($id)
    {
        $decryptedId = Crypt::decryptString($id);
        $buyer = Buyer::findOrFail($decryptedId);
        return view('buyers.edit', compact('buyer'));
    }
    public function update(Request $request, $id)
    {
        DB::beginTransaction();
        try {
            $validated = $request->validate([
                'byr_name' => 'required|string|max:255',
                'byr_type' => 'required|integer',
                'byr_id_type' => [
                    'nullable',
                    'required_if:byr_type,1',
                    'in:NTN,CNIC'
                ],
                'byr_ntn_cnic' => [
                    'nullable',
                    'required_if:byr_type,1',
                    function ($attribute, $value, $fail) use ($request) {
                        if ($request->byr_id_type === 'NTN' && !preg_match('/^[0-9]{7}$/', $value)) {
                            $fail('Buyer NTN must be exactly 7 digits.');
                        }
                        if ($request->byr_id_type === 'CNIC' && !preg_match('/^[0-9]{13}$/', $value)) {
                            $fail('Buyer CNIC must be exactly 13 digits (without dashes).');
                        }
                    }
                ],
                'byr_address' => 'required|string',
                'byr_province' => 'required|string',
                'byr_account_title' => 'required|string|max:255',
                'byr_account_number' => 'required|string|max:255',
                'byr_reg_num' => 'required|string|max:255',
                'byr_contact_num' => 'required|string|max:20',
                'byr_contact_person' => 'required|string|max:255',
                'byr_IBAN' => 'required|string|max:255',
                'byr_acc_branch_name' => 'required|string|max:255',
                'byr_acc_branch_code' => 'required|string|max:255',
                'byr_logo' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            ]);
            $buyer = Buyer::findOrFail($id);
            // Keep old data for hash comparison
            $oldData = $buyer->toArray();
            // Handle logo update
            if ($request->hasFile('byr_logo')) {
                // Delete old logo if exists
                if ($buyer->byr_logo && file_exists(public_path('uploads/buyer_images/' . $buyer->byr_logo))) {
                    unlink(public_path('uploads/buyer_images/' . $buyer->byr_logo));
                }
                $file = $request->file('byr_logo');
                $extension = $file->getClientOriginalExtension();
                $filename = time() . '.' . $extension;
                $file->move(public_path('uploads/buyer_images/'), $filename);
                $validated['byr_logo'] = $filename;
            }
            $buyer->update($validated);
            // ✅ Log activity with old and new data
            logActivity(
                'update',
                'Updated client: ' . $buyer->byr_name,
                ['old' => $oldData, 'new' => $buyer->toArray()],
                $buyer->id,
                'buyers'
            );
            DB::commit();
            return redirect()->route('buyers.index')
                ->with('message', 'Client updated successfully.');
        } catch (\Illuminate\Validation\ValidationException $e) {
            DB::rollBack();
            return redirect()->back()->withErrors($e->errors())->withInput();
        } catch (\Exception $e) {
            DB::rollBack();
            dd($e->getMessage(), $e->getFile(), $e->getLine());
        }
    }
    public function delete($id)
    {
        $buyer = Buyer::findOrFail($id);
        $oldData = $buyer->toArray();
        $buyer->delete();
        // ✅ Log delete activity
        logActivity(
            'delete',
            'Deleted client: ' . $oldData['byr_name'],
            $oldData,
            $id,
            'buyers'
        );
        return redirect()->route('buyers.index')->with('message', 'Client deleted successfully.');
    }
}