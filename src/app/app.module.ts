import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import {MatToolbarModule} from '@angular/material/toolbar';
import { HeaderComponent } from './component/header/header.component';
import { ErrorPageComponent } from './component/error-page/error-page.component';
import { NavbarComponent } from './component/navbar/navbar.component';
import { ApLogoComponent } from './component/ap-logo/ap-logo.component';
import { HttpClientModule } from '@angular/common/http';
import { RedesComponent } from './component/redes/redes.component';

@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    ErrorPageComponent,
    NavbarComponent,
    ApLogoComponent,
    RedesComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    MatToolbarModule,
    HttpClientModule
   
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
