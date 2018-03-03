<?php

namespace App\Http\Middleware;
use Closure;
use Auth;

class RolesAdminMiddleware {

    public function handle($request, Closure $next) {
        // Perform Action
        if (!Auth::user()->hasRole('admin')) {
            return response()->view('errors.403');
        }

        return $next($request);
    }

}
