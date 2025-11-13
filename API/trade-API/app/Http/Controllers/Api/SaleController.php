<?php
namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Sale;

    class SaleController extends Controller
    {
        public function index(){
            return response()->json(Sale::with('videoGame')->get());
        }

        public function store(Request $request){
            $sale = Sale::create([
                'buyer' => request ->buyer,
                'totalPrice' => $request->totalPrice,
                'videogameId'=> $request->videogameId
            ]);

            return response()->json([
                'message'=> 'Venta registrada exitosamente',
                'sale' => $sale    
            ],201);
        }
    }