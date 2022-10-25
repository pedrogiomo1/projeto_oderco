import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ShippingService {

  public apiUrl = 'http://localhost:8080/api/cotacao';

  constructor(
    private http: HttpClient
  ) {
  }

  public get_shipping_price(): Observable<any> {
    return this.http.get(this.apiUrl);
  }
  
  public create_shipping_price(form:any): Observable<any> {
    return this.http.post(this.apiUrl, form);
  }

  public calculate_shipping_price(form:any): Observable<any> {
    return this.http.put(this.apiUrl, form);
  }

}
