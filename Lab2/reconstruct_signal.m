function x_r = reconstruct_signal(n_d, x_d, t_a)
% INPUTS
% n_d: array of n values
% x_d: array of sampled values
% t_a: array of arbitrary t values for which we must compute x_r
%
% OUTPUTS
% x_a: array of reconstructed x values for t_a

Ts = 0.025; % sampling period
k = 1; % for triangular pulse
x_r = zeros(size(t_a)); % initialize output to be of same size as t_a

% repeat for each value of t in array t_a
for i = 1:length(t_a)
    t = t_a(i);

    % find what sampling interval t belongs to
    % t belongs to interval ((n0-0.5)Ts, (n0+0.5)Ts]
    n0 = ceil(t/Ts - 0.5);
    % compute the sum in equation (4)
    x_sum = 0; % initialise sum
    for n = n0-k:n0+k
        idx = find(n_d == n);
        if isempty(idx)
            continue;
        end

        % value for x[n] is taken from x_d
        x_n = x_d(idx(1));

        % add to the sum
        x_sum = x_sum + x_n * my_pulse(t - n * Ts);
    end

    x_r(i) = x_sum; % store sum in output

end
end