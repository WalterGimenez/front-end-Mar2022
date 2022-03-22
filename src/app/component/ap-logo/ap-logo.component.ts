import { Component, OnInit } from '@angular/core';
import { PortfolioService } from 'src/app/service/portfolio.service';

@Component({
  selector: 'app-ap-logo',
  templateUrl: './ap-logo.component.html',
  styleUrls: ['./ap-logo.component.css']
})
export class ApLogoComponent implements OnInit {
  dataAP: any;
  
  constructor(private datosPortfolio: PortfolioService) { }

  ngOnInit(): void {
    this.datosPortfolio.obtenerDatos().subscribe(data => {
      this.dataAP = data.misc;
    });
  }
}

