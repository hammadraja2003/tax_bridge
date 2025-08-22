<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\LoginRequest;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;

class AuthenticatedSessionController extends Controller
{
    /**
     * Display the login view.
     */
    public function create(): View
    {
        return view('auth.login');
    }
    /**
     * Handle an incoming authentication request.
     */
    // public function store(LoginRequest $request): RedirectResponse
    // {
    //     $request->authenticate();
    //     $request->session()->regenerate();
    //     return redirect()->intended(route('dashboard', absolute: false))->with('message', 'Signed in successfully!');
    // }
    public function store(Request $request)
    {
        $credentials = $request->only('email', 'password');

        if (Auth::attempt($credentials)) {
            $user = Auth::user();

            if ($user->twofa_enabled) {
                // Temporarily log out until OTP is verified
                Auth::logout();

                // Keep which user is verifying in session
                $request->session()->put('2fa:user:id', $user->id);

                return redirect()->route('2fa.verify');
            }

            // No 2FA → normal login
            $request->session()->regenerate();
            return redirect()->intended('dashboard')->with('message','User Login Successfull');
        }

        return redirect()->back()->withErrors(['toast_error' => 'Invalid credentials.']);
    }
    /**
     * Destroy an authenticated session.
     */
    public function destroy(Request $request): RedirectResponse
    {
        Auth::guard('web')->logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect('/')->with('success', 'Logged out.');
    }
}