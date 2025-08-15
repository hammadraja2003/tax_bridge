<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use PragmaRX\Google2FA\Google2FA;
use Illuminate\Support\Facades\Auth;
use SimpleSoftwareIO\QrCode\Facades\QrCode;

class TwoFactorSetupController extends Controller
{
    public function showSetupForm()
    {
        $user = Auth::user();
        $google2fa = new Google2FA();

        // If enabling for first time, prepare a fresh secret (but don't save yet)
        $secret = $user->twofa_secret ?: $google2fa->generateSecretKey();

        // Build the otpauth URL (what authenticator apps scan)
        $otpauth = $google2fa->getQRCodeUrl(
            'SecureismInvoiceManagment',    // issuer (shows in the authenticator app)
            $user->email,     // account name
            $secret
        );

        // Render QR as SVG/PNG (you already have the QR package set up)
        $qrSvg = QrCode::format('svg')->size(200)->generate($otpauth);

        return view('auth.2fa-setup', [
            'qrSvg' => $qrSvg,
            'secret' => $secret,
            'enabled' => (bool) $user->twofa_enabled,
        ]);
    }

    public function enable(Request $request)
    {
        $request->validate([
            'secret' => 'required|string',
            'code'   => 'required|digits:6',
        ]);

        $google2fa = new Google2FA();
        $valid = $google2fa->verifyKey($request->secret, $request->code);

        if (!$valid) {
            return back()->withErrors(['code' => 'Invalid code. Make sure you scanned the QR and try again.']);
        }

        $user = Auth::user();
        $user->twofa_secret = $request->secret;
        $user->twofa_enabled = true;
        $user->save();

        return redirect()->route('2fa.setup')->with('status', 'Two-factor authentication enabled.');
    }

    public function disable()
    {
        $user = Auth::user();
        $user->twofa_enabled = false;
        $user->twofa_secret = null; // optionally keep the secret if you want quick re-enable
        $user->save();

        return redirect()->route('2fa.setup')->with('status', 'Two-factor authentication disabled.');
    }
}