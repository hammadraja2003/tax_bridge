<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Crypt;
use App\Models\Item;

class ItemController extends Controller
{
    public function index()
    {
        $items = Item::latest()->paginate(10);
        return view('items.index', compact('items'));
    }
    public function create()
    {
        return view('items.create');
    }
    public function store(Request $request)
    {
        $request->validate([
            'item_description' => 'required|string',
            'item_price' => 'required|numeric',
            'item_tax_rate' => 'required|string|max:10',
            'item_uom' => 'required|string|max:50',
        ]);
        Item::create($request->all());
        return redirect()->route('items.index')->with('message', 'Item created successfully.');
    }
    public function edit($id)
    {
        $decryptedId = Crypt::decryptString($id);
        $item = Item::findOrFail($decryptedId);
        return view('items.edit', compact('item'));
    }
    public function update(Request $request, $id)
    {
        $request->validate([
            'item_description' => 'required|string|max:255',
            'item_price' => 'required|numeric',
            'item_tax_rate' => 'required|string|max:10',
            'item_uom' => 'required|string|max:50',
            'item_hs_code' => 'nullable|string|max:20',
        ]);
        $item = Item::findOrFail($id);
        $item->update($request->all());
        return redirect()->route('items.index')->with('message', 'Item updated successfully.');
    }
    public function delete($id)
    {
        $item = Item::findOrFail($id);
        $item->delete();
        return redirect()->route('items.index')->with('message', 'Item deleted successfully.');
    }
}