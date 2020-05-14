/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

class Navegacion{
    constructor({titulo}){
        this.titulo = titulo;
        this.render();
    }
    render(){
        this.elem.innerHTML =`
        <nav class="navbar navbar-default no-margin">
    <div class="navbar-header fixed-brand">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" id="menu-toggle">
        <span>
          <ion-item>
            <ion-icon class="icon" name="${this.titulo}"></ion-icon>
          </ion-item>
        </span>
      </button>
      <a class="navbar-brand" href="index.html"><img src="img/CTL Logo Reverse INT.png" id="headerLogo" alt=""></a>
    </div>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><button class="navbar-toggle collapse in" data-toggle="collapse" id="menu-toggle-2">
            <ion-item>
              <ion-icon class="icon" name="menu"></ion-icon>
            </ion-item>
          </button></li>
      </ul>
    </div>
  </nav>`;
        this.elem.querySelector("section").create();
    }
    enviar(e){
        e.preventDefault();
        console.log(this.titulo);
    }

}

