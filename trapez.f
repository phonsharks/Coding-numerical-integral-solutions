      PROGRAM INTEGRAL
      IMPLICIT REAL*8(A-H,O-Z)
      A=0.0
      B=1.0
      STAM=F(1.D0)-1.D0
      N=10
      DO 10 I=1,30
         CALL TRAPEZ(A,B,N,STRAPEZ)
         WRITE(*,20) N,STRAPEZ-STAM
         N=N+10
10    CONTINUE
20    FORMAT(3X,I5,F16.8)
      END
      
      FUNCTION F(X)
      IMPLICIT REAL*8(A-H,O-Z)
      F=DEXP(X)
      RETURN
      END
      
      SUBROUTINE TRAPEZ(A,B,N,S)
      IMPLICIT REAL*8(A-H,O-Z)
      IF(N.LE.1.OR.A.GT.B) STOP 'HATALI VERI!'
      H=(B-A)/N
      S=0.5*(F(A)+F(B))
      DO 10 I=1,N-1
         X=A+I*H
         S=S+F(X)
10    CONTINUE
      S=H*S
      RETURN
      END
