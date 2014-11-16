%����ǲο������120���׵��¼���������
%�ȿ��ǵ�����ϵͳ��ʱ������
%Xi��״̬������2ά�ģ�

clear;
close all;
clc;

L = [
    3      0    0    -1    -1    -1 ;
    -1     1    0    0     0     0;
    -1    -1    2    0    0    0;
    -1     0    0    1    0    0;
    0        0    0    -1    1    0;
    0        0    0    0    -1    1;
    ];

% delta_time = 1;
delta_time = 0.01;% 0.01 ��ʾÿ�ε���һ�ε�ʱ������0.01���ӣ�Ҳ���ǿ���Ƶ����100hz�����Ƶ����ʵ�����˻��ȿ������ǿ��ж��Ҿ����õ�
total_time_s = 100;% �����ʱ�䳤�ȣ�100��
% total_time_s = 1;
loop_tick = total_time_s/delta_time;% ѭ�����ܲ���

ksi1 = [0.4 0.3]';
ksi2 = [0.5 0.2]';
ksi3 = [0.6 0.1]';
ksi4 = [0.7 0.0]';
ksi5 = [0.8 -0.1]';
ksi6 = [0.4 -0.2]';

ksi1_trig = zeros(1,2)';
ksi2_trig = zeros(1,2)';
ksi3_trig = zeros(1,2)';
ksi4_trig = zeros(1,2)';
ksi5_trig = zeros(1,2)';
ksi6_trig = zeros(1,2)';

error_1 = zeros(1,2)';
error_2 = zeros(1,2)';
error_3 = zeros(1,2)';
error_4 = zeros(1,2)';
error_5 = zeros(1,2)';
error_6 = zeros(1,2)';

c1 = 1.1;% ������� ���������һ����������ô����ѡ���� 
coefficient = -1;
exp_alpha = 0.9;% ����Ǵ�����ֵ��ָ��������˥������ ���������һ����������ô����ѡ����
% exp_alpha = 2.1;% ������alphaѡ����� �����ʣ������ٶȻ�ӿ죬����Ҳ��Ƶ�������¼�����

% trig1_tick;% ״̬����1����ʱ��
trig1_tick = zeros(1,loop_tick);
trig2_tick = zeros(1,loop_tick);
trig3_tick = zeros(1,loop_tick);
trig4_tick = zeros(1,loop_tick);
trig5_tick = zeros(1,loop_tick);
trig6_tick = zeros(1,loop_tick);

for i = 1:1:loop_tick
    %***************************************
    %***************
    error_1 = ksi1_trig - ksi1;    
    ksi1_next = ( coefficient * (   L(1,1) * (ksi1 + error_1) + L(1,2) * (ksi2 + error_2) + L(1,3) * (ksi3 + error_3) + ...
                                    L(1,4) * (ksi4 + error_4) + L(1,5) * (ksi5 + error_5) + L(1,6) * (ksi6 + error_6)  )  ) * delta_time + ksi1;   

    func_trig1 = norm(error_1) - c1 * exp( - exp_alpha * (i*delta_time) );
    if func_trig1 > 0        
        ksi1_trig = ksi1_next;
        trig1_tick(i) = i; 
    end
    
    %***************************************
    %***************
    error_2 = ksi2_trig - ksi2;    
    ksi2_next = ( coefficient * (   L(2,1) * (ksi1 + error_1) + L(2,2) * (ksi2 + error_2) + L(2,3) * (ksi3 + error_3) + ...
                                    L(2,4) * (ksi4 + error_4) + L(2,5) * (ksi5 + error_5) + L(2,6) * (ksi6 + error_6)  )  ) * delta_time + ksi2;   

    func_trig2 = norm(error_2) - c1 * exp( - exp_alpha * (i*delta_time) );
    if func_trig2 > 0        
        ksi2_trig = ksi2_next;
        trig2_tick(i) = i; 
    end
    
    %***************************************
    %***************
    error_3 = ksi3_trig - ksi3;    
    ksi3_next = ( coefficient * (   L(3,1) * (ksi1 + error_1) + L(3,2) * (ksi2 + error_2) + L(3,3) * (ksi3 + error_3) + ...
                                    L(3,4) * (ksi4 + error_4) + L(3,5) * (ksi5 + error_5) + L(3,6) * (ksi6 + error_6)  )  ) * delta_time + ksi3;   

    func_trig3 = norm(error_3) - c1 * exp( - exp_alpha * (i*delta_time) );
    if func_trig3 > 0        
        ksi3_trig = ksi3_next;
        trig3_tick(i) = i; 
    end
    
    
    %***************************************
    %***************
    error_4 = ksi4_trig - ksi4;    
    ksi4_next = ( coefficient * (   L(4,1) * (ksi1 + error_1) + L(4,2) * (ksi2 + error_2) + L(4,3) * (ksi3 + error_3) + ...
                                    L(4,4) * (ksi4 + error_4) + L(4,5) * (ksi5 + error_5) + L(4,6) * (ksi6 + error_6)  )  ) * delta_time + ksi4;   

    func_trig4 = norm(error_4) - c1 * exp( - exp_alpha * (i*delta_time) );
    if func_trig4 > 0        
        ksi4_trig = ksi4_next;
        trig4_tick(i) = i; 
    end
    
    %***************************************
    %***************
    error_5 = ksi5_trig - ksi5;    
    ksi5_next = ( coefficient * (   L(5,1) * (ksi1 + error_1) + L(5,2) * (ksi2 + error_2) + L(5,3) * (ksi3 + error_3) + ...
                                    L(5,4) * (ksi4 + error_4) + L(5,5) * (ksi5 + error_5) + L(5,6) * (ksi6 + error_6)  )  ) * delta_time + ksi5;   

    func_trig5 = norm(error_5) - c1 * exp( - exp_alpha * (i*delta_time) );
    if func_trig5 > 0        
        ksi5_trig = ksi5_next;
        trig5_tick(i) = i; 
    end
    
    %***************************************
    %***************
    error_6 = ksi6_trig - ksi6;    
    ksi6_next = ( coefficient * (   L(6,1) * (ksi1 + error_1) + L(6,2) * (ksi2 + error_2) + L(6,3) * (ksi3 + error_3) + ...
                                    L(6,4) * (ksi4 + error_4) + L(6,5) * (ksi5 + error_5) + L(6,6) * (ksi6 + error_6)  )  ) * delta_time + ksi6;   

    func_trig6 = norm(error_6) - c1 * exp( - exp_alpha * (i*delta_time) );
    if func_trig6 > 0        
        ksi6_trig = ksi6_next;
        trig6_tick(i) = i; 
    end

    
    ksi1 = ksi1_next;% ���������ֵӦ�÷�����������е�ksi״̬�������½�����
    ksi1_matrix(:,i) = ksi1;
    error1_matrix(i) = norm(error_1);
    
    ksi2 = ksi2_next;% ���������ֵӦ�÷�����������е�ksi״̬�������½�����
    ksi2_matrix(:,i) = ksi2;
    error2_matrix(i) = norm(error_2);
    
    ksi3 = ksi3_next;% ���������ֵӦ�÷�����������е�ksi״̬�������½�����
    ksi3_matrix(:,i) = ksi3;
    error3_matrix(i) = norm(error_3);
    
    ksi4 = ksi4_next;% ���������ֵӦ�÷�����������е�ksi״̬�������½�����
    ksi4_matrix(:,i) = ksi4;
    error4_matrix(i) = norm(error_4);
    
    ksi5 = ksi5_next;% ���������ֵӦ�÷�����������е�ksi״̬�������½�����
    ksi5_matrix(:,i) = ksi5;
    error5_matrix(i) = norm(error_5);
    
    ksi6 = ksi6_next;% ���������ֵӦ�÷�����������е�ksi״̬�������½�����
    ksi6_matrix(:,i) = ksi6;
    error6_matrix(i) = norm(error_6);
    
    threshold(i) = c1 * exp( - i*delta_time);
    
    
 
end

time = 1:1:loop_tick;

figure;
plot(time,ksi1_matrix(1,:),'r',time,ksi2_matrix(1,:),'g',time,ksi3_matrix(1,:),'b',time,ksi4_matrix(1,:),'c',time,ksi5_matrix(1,:),'m',time,ksi6_matrix(1,:),'k');

figure;
subplot(3, 2, 1);
plot(time, threshold, 'r', time, error1_matrix, 'r');
subplot(3, 2, 2);
plot(time, threshold, 'r', time, error2_matrix, 'g');
subplot(3, 2, 3);
plot(time, threshold, 'r', time, error3_matrix, 'b');
subplot(3, 2, 4);
plot(time, threshold, 'r', time, error4_matrix, 'c');
subplot(3, 2, 5);
plot(time, threshold, 'r', time, error5_matrix, 'm');
subplot(3, 2, 6);
plot(time, threshold, 'r', time, error6_matrix, 'k');


figure;
trig1_tick_ordinate = ones(1,loop_tick);% ������λ��
scatter(trig1_tick, trig1_tick_ordinate, 8, 'r', 'x');
hold on;
trig2_tick_ordinate = ones(1,loop_tick) + 1;% ������λ��
scatter(trig2_tick, trig2_tick_ordinate, 8, 'g', 'x');
hold on;
trig3_tick_ordinate = ones(1,loop_tick) + 2;% ������λ��
scatter(trig3_tick, trig3_tick_ordinate, 8, 'b', 'x');
hold on;
trig4_tick_ordinate = ones(1,loop_tick) + 3;% ������λ��
scatter(trig4_tick, trig4_tick_ordinate, 8, 'c', 'x');
hold on;
trig5_tick_ordinate = ones(1,loop_tick) + 4;% ������λ��
scatter(trig5_tick, trig5_tick_ordinate, 8, 'm', 'x');
hold on;
trig6_tick_ordinate = ones(1,loop_tick) + 5;% ������λ��
scatter(trig6_tick, trig6_tick_ordinate, 8, 'k', 'x');

legend('trig1\_tick', 'trig2\_tick', 'trig3\_tick', 'trig4\_tick', 'trig5\_tick', 'trig6\_tick');
xlabel('time(0.01s)');
axis([-inf inf -0.5 8]);

% hold on;
% temp = zeros(1,loop_tick)+3;
% plot(time, temp, 'k', 'LineWidth',5);




















