%% Load data
data = xlsread('Linear.xlsx',2);

time  = data(:,1);
mass1 = data(:,2);
mass2 = data(:,3);
mass3 = data(:,4);
mass4 = data(:,5);
mass5 = data(:,6);

%% Fit data to offet exponential
T = 0:10:3600;

mdl1 = fitnlm(table(time, mass1),@(b,x) b(1) * exp(-b(2)*x(:, 1)) + b(3), [-2, 0.002, 1002]);
mdl2 = fitnlm(table(time, mass2),@(b,x) b(1) * exp(-b(2)*x(:, 1)) + b(3), [-2, 0.002, 1002]);
mdl3 = fitnlm(table(time, mass3),@(b,x) b(1) * exp(-b(2)*x(:, 1)) + b(3), [-2, 0.002, 1002]);
mdl4 = fitnlm(table(time, mass4),@(b,x) b(1) * exp(-b(2)*x(:, 1)) + b(3), [-2, 0.002, 1002]);
mdl5 = fitnlm(table(time, mass5),@(b,x) b(1) * exp(-b(2)*x(:, 1)) + b(3), [-2, 0.002, 1002]);

coeff1 = mdl1.Coefficients{:, 'Estimate'};
coeff2 = mdl2.Coefficients{:, 'Estimate'};
coeff3 = mdl3.Coefficients{:, 'Estimate'};
coeff4 = mdl4.Coefficients{:, 'Estimate'};
coeff5 = mdl5.Coefficients{:, 'Estimate'};

fit1 = coeff1(1) * exp(-coeff1(2)*T) + coeff1(3);
fit2 = coeff2(1) * exp(-coeff2(2)*T) + coeff2(3);
fit3 = coeff3(1) * exp(-coeff3(2)*T) + coeff3(3);
fit4 = coeff4(1) * exp(-coeff4(2)*T) + coeff4(3);
fit5 = coeff5(1) * exp(-coeff5(2)*T) + coeff5(3);

plot(time, mass1, 'o', Color = 'b'); hold on
plot(time, mass2, 'o', Color = 'r')
plot(time, mass3, 'o', Color = 'c')
plot(time, mass4, 'o', Color = 'm')
plot(time, mass5, 'o', Color = 'g')
plot(T, fit1, Color = 'b')
plot(T, fit2, Color = 'r')
plot(T, fit3, Color = 'c')
plot(T, fit4, Color = 'm')
plot(T, fit5, Color = 'g'); hold off

legend('0.002 pers', '0.001 pers', '0.00075 pers', '0.0005 pers', '0.00025 pers')

%% Print Equations

[sprintf('m1 = %e*exp(-%e*t) + %e', coeff1);
sprintf('m2 = %e*exp(-%e*t) + %e', coeff2);
sprintf('m3 = %e*exp(-%e*t) + %e', coeff3);
sprintf('m4 = %e*exp(-%e*t) + %e', coeff4);
sprintf('m5 = %e*exp(-%e*t) + %e', coeff5)]


