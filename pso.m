%------------------------------------------------------------ ----------------------------------------- -----------------------------start
tic     %para contar el tiempo de corrida
clc; clear;  close all
% rng default %control de random numbers
LB=[0];  %lower bounds 
UB=[10];  %upper bounds 

% pso parameters values
% m=1;  % number of variables
n=5;  % population size
wmax=0.9;  % inertia weight
wmin=0.4;  % inertia weight
c1=2;  % acceleration factor
c2=2;  % acceleration factor
% ---------pso main program----------------------------------------start
maxite=100;  % set maximum number of iteration  
maxrun=10;  % set maximum number of runs need to be
for run=1:maxrun
     % pso initialization-------------------------------------start
    x0=rand(1,n);
    x=x0;  % initial population
    v=0.1*x0;  % initial velocity
    
    %############### fitness funtion(DC-DC converter) ################
     for i=1:n
         f0(i,1)=x(i)*exp(-norm(x)^2); 
     end
     [fmax0,index0]=max(f0); %find Fbest and index
    %###############################################################
    pbest=x0;  % initial pbest
    gbest=x0(index0);  % initial gbest

    %######### pso algorithm start ########################################
    ite=1; %iteracion inicial
    tolerance=1; %tolerancia inicial
    while ite<=maxite && tolerance>10^-12
        w=wmax-(wmax-wmin)*ite/maxite; % update inertial weight
        % pso velocity updates
        for i=1:n
                v(i)=w*v(i)+c1*rand()*(pbest(i)-x(i))+c2*rand()*(gbest(1)-x(i));
        end
        % pso position update
        for i=1:n
             x(i)=x(i)+v(i);
        end
        
        for i=1:n
                if x(i)<LB
                 x(i)=LB;
                elseif x(i)>UB
                 x(i)=UB;
                end
        end    % ---------handling boundary violations-------------
        
        % evaluating fitness (evaluar convertidor DC-DC) #####################
        for i=1:n
           f(i)=x(i)*exp(-norm(x)^2);  
        end
        % #################################################
        % updating pbest and fitness
        for i=1:n
            if f(i)>f0(i) 
                pbest(i)=x(i); %best personal
                f0(i)=f(i);
            end
        end

        [fmax,index]=max(f0);  % finding out the best particle
        ffmax(ite,run)=fmax;  % storing best fitness
        ffite(run)=ite;  % storing iteration count
        % updating gbest and best fitness
        if fmax>fmax0
            gbest=pbest(index); %global best
            fmax0=fmax;
        end
       ite=ite+1;
    end
    %-----------------------------------------------------end
    gbest;
    fvalue=gbest*exp(-norm(x)^2);   %best fitness funtion             
    fff(run)=fvalue;                %save best fitness in a table
    rgbest(run,:)=gbest;            %save best particle in a table
end
% pso main program------------------------------------------------------end

% fprintf('*********************************************************\n');
fprintf('Final Results-----------------------------\n');
[bestfun,bestrun]=max(fff)       %best fitness funtion in all table
best_particle=rgbest(bestrun,:) %best particle in all table
fprintf('*********************************************************\n');
toc        %stop countin running time



% % ----------PSO convergence characteristic---------------------
% plot(ffmax(1:ffite(bestrun),bestrun),'-k');
% xlabel('Iteration');
% ylabel('Fitness function value');
% title('PSO convergence characteristic')
%##########################################################################
% ------------------------------------------------------------- ---------------------------------------------------------------------- end