# ADAPTIVE-NOISE-CANCELLATION

INTRODUCTION TO ANC

The usual method of estimating a signal corrupted by additive noise is to pass it through a filter that tends to suppress the noise while leaving the signal relatively unchanged i.e. direct filtering.

The design of such filters is the domain of optimal filtering, which originated with the pioneering work of Wiener and was extended and enhanced by Kalman, Bucy and others. Filters used for direct filtering can be either Fixed or Adaptive.
1.	Fixed filters: The design of fixed filters requires a priori knowledge of both the signal and the noise, i.e. if we know the signal and noise beforehand, we can design a filter that passes frequencies contained in the signal and rejects the frequency band occupied by the noise.
2.	Adaptive filters: Adaptive filters, on the other hand, have the ability to adjust their impulse response to filter out the correlated signal in the input. They require little or no a priori knowledge of the signal and noise characteristics. (If the signal is narrowband and noise broadband, which is usually the case, or vice versa, no a priori information is needed; otherwise they require a signal (desired response) that is correlated in some sense to the signal to be estimated.). Moreover adaptive filters have the capability of adaptively tracking the signal under non-stationary conditions.

ADAPTIVE NOISE CANCELLATION(PRINCIPLE)

Adaptive Noise Canceller (ANC) has two inputs – primary and reference(Refer Image ANC.png). The primary input receives a signal s from the signal source that is corrupted by the presence of noise n uncorrelated with the signal. The reference input receives a noise n0 uncorrelated with the signal but correlated in some way with the noise n. The noise no passes through a filter to produce an output nˆ that is a close estimate of primary input noise. This noise estimate is subtracted from the corrupted signal to produce an estimate of the signal at sˆ , the ANC system output.

In noise canceling systems a practical objective is to produce a system output sˆ = s + n – nˆ that is a best fit in the least squares sense to the signal s. This objective is accomplished by feeding the system output back to the adaptive filter and adjusting the filter through an LMS adaptive algorithm to minimize total system output power. In other words the system output serves as the error signal for the adaptive process.
Assume that s, n0, n1 and y are statistically stationary and have zero means. The signal s is uncorrelated with n0 and n1, and n1 is correlated with n0.
sˆ = s + n – nˆ

⇒	sˆ 2 = s2 + (n - nˆ )2 +2s(n - nˆ )
 
Taking expectation of both sides and realizing that s is uncorrelated with n0
and nˆ , E[ sˆ 2] = E[s2] + E[(n - nˆ )2] + 2E[s(n - nˆ )]

= E[s2] + E[(n - nˆ )2]

The signal power E[s2] will be unaffected as the filter is adjusted to minimize E[ sˆ 2] ⇒ minE[sˆ2] =E[s2] + minE[(n-nˆ)2]
Thus, when the filter is adjusted to minimize the output noise power E[ sˆ 2], the output noise power E[(n - nˆ )2] is also minimized. Since the signal in the output remains constant, therefore minimizing the total output power maximizes the output signal-to-noise ratio.
Since	( sˆ - s) = (n – nˆ )

This is equivalent to causing the output sˆ to be a best least squares estimate of the signal s. 
