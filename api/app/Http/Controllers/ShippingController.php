<?php

namespace App\Http\Controllers;

use App\Http\Requests\ShippingCreateRequest;
use App\Http\Requests\ShippingPriceCreateRequest;
use App\Models\Shipping;
use App\Models\ShippingPrice;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

class ShippingController extends Controller
{
    
    public function createShippingPrice(ShippingCreateRequest $request):JsonResponse {

        $shipping = new Shipping();

        $shipping->uf = $request->uf;
        $shipping->percentual_cotacao = $request->percentual_cotacao;
        $shipping->valor_extra = $request->valor_extra;
        $shipping->transportadora_id = $request->transportadora_id;
        
        try {
            $shipping->save();
        } catch (\Exception $th) {
            $response = [
                'Code' => '500',
                'Type' => 'Error',
                'Message' => $th->getMessage(),
                'Data' => null
            ];
            return new JsonResponse($response, 500);
        }
        $response = [
            'Code' => '200',
            'Type' => 'Success',
            'Message' => "Cotação de frete criado com sucesso!",
            'Data' => $shipping
        ];
        return new JsonResponse($response, 200);
    }
    
    function insert_sort($result, $item) {
    // Variável de controle da posição na lista:
    $index = 0;
    // Percorre a lista:
    foreach ($result as $j => $value) {
        // Verifica a condição: (novo item) > (item da lista)?
        if (array_values($item)[1] < array_values($value)[1]) {
            // Sim, então pare de percorrer a lista
            break;
        }
        // Não, então continue para a próxima posição:
        $index++;
    }
    // O novo item será inserido na posição $index
    // Para isso, precisamos abrir o espaço na lista com a função array_splice:
    array_splice($result, $index, 0, array($item));
    // Retorne a lista ordenada:
    return $result;
    }

    public function simulatePrice(Request $request):JsonResponse {

        $shipping = Shipping::where('uf', '=', $request->uf)->get();

        if ($shipping->count() == 0) {
            $response = [
                'Code' => '500',
                'Type' => 'Error',
                'Message' => 'Cotação não cadastrada para este UF.',
                'Data' => null
            ];
            return new JsonResponse($response, 500);
        }

        $array = [];

        foreach ($shipping as $s) {

            $shipping_price = ($s->percentual_cotacao/100)*$request->valor_pedido+$s->valor_extra;
            $shipping_price = number_format($shipping_price, 2, '.', '');
            
            $a = [
                'id_transportadora' => $s->transportadora_id,
                'valor_cotacao' => $shipping_price
            ];

            $array = $this->insert_sort($array, $a);

        }

        if(count($array)>=3) {
            $array = array($array[0],$array[1],$array[2]);
        }

        $response = [
            'Code' => '200',
            'Type' => 'Success',
            'Message' => "Cotação de frete feita com sucesso!",
            'Data' => $array
        ];
        return new JsonResponse($response, 200);

    }
    
    public function listShippingPrice() {
        try {
            $shipping = Shipping::get();
        } catch (\Exception $ex) {
            $response = [
                'Code' => '500',
                'Type' => 'Error',
                'Message' => $ex->getMessage(),
                "Data" => null
            ];
            return new JsonResponse($response, 400);
        }

        $response = [
            'Code' => '200',
            'Type' => 'Success',
            'Message' => 'Lista de Cotações!',
            "Data" => $shipping
        ];

        return new JsonResponse($response, 200);
    }

}