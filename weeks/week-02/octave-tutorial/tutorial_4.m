% J. Dylan White
% 03.23.2020
% Octave Tutorial - Plotting Data

% Initiate x axis and functions
t = [0:0.01:0.98];
y1 = sin(2*pi*4*t);
y2 = cos(2*pi*4*t);

% Put both plots on one figure
plot(t,y1);
hold on;
plot(t,y2,'r');

% Label the plots and save
ylabel('value');
xlabel('time');
legend('sin','cos')
title('Simple Sinusoid Plot')
print -dpng 'sinusoid.png';
close

% Put the two plots in separate figures
figure(1); plot(t,y1);
figure(2); plot(t,y2);
close

% Create a 1x2 grid figure and change axes
subplot(1,2,1);
plot(t,y1);
subplot(1,2,2);
plot(t,y2);
axis([0.5 1 -1 1])

% Clear the figure and visualize a matrix
clf;
A = magic(5);
imagesc(A), colorbar, colormap gray;
figure(2); imagesc(magic(15)), colorbar, colormap gray;
close