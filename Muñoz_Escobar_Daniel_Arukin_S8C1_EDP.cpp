#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include<time.h>
#include<cmath>
#include <fstream>

using namespace std;

float c=300;
float L=2;
float h=0.1;
float dx=L/100;
float dt=0.5*(dx/c);
float N_pasos= (0.1/dt)+2;

float EDP_diferencias_finitas_ecuacion_onda(int N, float c, float L, float h, float dx, float dt, float t_final);

int main(){
	float cuerda= EDP_diferencias_finitas_ecuacion_onda(100, 300, 2, 0.1, 0.02, 3.33*pow(10,-5), 0.1);
}


float EDP_diferencias_finitas_ecuacion_onda(int N, float c, float L, float h, float dx, float dt, float t_final){
	ofstream outfile;
	outfile.open("Posiciones de la cuerda");
	float x[N];
	float u_Pasado[N];
	float u_Presente[N];
	float u_Futuro[N];
	float Datos[N][N];
	
	float m=h/(L/2.0);
	N_pasos= 3002;
	x[0]=0;
	u_Pasado[0]=0;
	
	for(int i=1;i<N/2;i++){
		x[i]=i;
		u_Pasado[i]=i*m*dx;
	}
	
	for(int i=N/2;i>N-1;i++){
		x[i]=i;
		u_Pasado[i]=-1*m*dx*i+2*h;
	}
	x[N]=N;
	u_Pasado[N]=0;
	
	for(int i=1;i<N-1;i++){
		u_Presente[i]=u_Pasado[i]+(0.5)*((pow(c,2)*pow(dt,2))/pow(dx,2))*(x[i+1]-2*x[1]+x[i-1]);
	}
	
	for(float t=0;t<=N_pasos;t++){
		int cont=1;
		for(int i=1;i<N-1;i++){
			u_Futuro[i]=2*u_Presente[i]-u_Pasado[i]+((pow(c,2)*pow(dt,2))/pow(dx,2))*(x[i+1]-2*x[i]+x[i-1]);
			cont++;
			
			}
		
		for(int i=0;i<N;i++){
			
			//cout<<"se cumplio la condicion"<<endl;
			outfile<<u_Futuro[i]<<" | "<<endl;
			
		}
		
		cout<<endl;
		
		for(int i=1;i<N-1;i++){
			u_Pasado[i]=u_Presente[i];
			u_Presente[i]=u_Futuro[i];
			
		}
	
	}
	outfile.close();
}
