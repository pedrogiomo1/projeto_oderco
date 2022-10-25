import { ShippingService } from './../../services/shipping.service';
import { Component, OnInit } from '@angular/core';
import { FormGroup, FormBuilder, Validators } from '@angular/forms';

@Component({
  selector: 'app-shipping-price',
  templateUrl: './shipping-price.component.html',
  styleUrls: ['./shipping-price.component.css']
})
export class ShippingPriceComponent implements OnInit {

  public loading: boolean = false;

  public show_calculated_shipping_price_list: boolean = false;

  public shipping_price_list: any;

  public calculated_shipping_price_list:any;

  shipping_create_form!: FormGroup;
  shipping_calculate_form!: FormGroup;

  constructor(
    private shippingServ:ShippingService,
    private form: FormBuilder
  ) { }

  ngOnInit(): void {
    this.shipping_create_form = this.form.group({
      uf: this.form.control('UF', Validators.required),
      percentual_cotacao: this.form.control('', Validators.required),
      valor_extra: this.form.control('', Validators.required),
      transportadora_id: this.form.control('Transportadora', Validators.required),
    });

    this.shipping_calculate_form = this.form.group({
      uf: this.form.control('UF', Validators.required),
      valor_pedido: this.form.control('', Validators.required),
    });

    this.shippingServ.get_shipping_price().subscribe(res => {
      this.shipping_price_list = res.Data;
    });
  }

  public create_shipping_price() {
    this.loading = true;
    this.shippingServ.create_shipping_price(this.shipping_create_form.value).subscribe(res => {
      alert("Cotação de frete criada!")
      this.loading = false;
      location.reload();
    },e => {
      alert("Erro ao criar cotação ou dados inválidos!")
      this.loading = false;
    });
  }

  public calculate_shipping_price() {
    this.loading = true;
    this.shippingServ.calculate_shipping_price(this.shipping_calculate_form.value).subscribe(res => {
      this.calculated_shipping_price_list = res.Data;
      this.show_calculated_shipping_price_list = true;
      alert("Cotação de frete calculada!");
      this.loading = false;
    },e => {
      alert("Cotação não cadastrada para este UF ou dados inválidos");
      this.loading = false;
      location.reload();
    });
  }

}
