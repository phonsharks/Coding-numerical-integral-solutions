      PROGRAM INTEGRAL
      IMPLICIT REAL*8(A-H,O-Z)
      A=0.0
      B=1.0
      STAM=F(1.D0)-1.D0
      N=4
      DO 10 I=1,6
         CALL TRAPEZ(A,B,N,STRAPEZ)
         CALL SIMPSON(A,B,N,SSIMPSON)
         WRITE(*,20) N,STRAPEZ-STAM,SSIMPSON-STAM
         N=N+4
10    CONTINUE
20    FORMAT(3X,I5,2F16.8)
      END
      
	FUNCTION F(X)
      IMPLICIT REAL*8(A-H,O-Z)
      F=DEXP(X)
      RETURN
      END
      
      SUBROUTINE SIMPSON(A,B,N,S)
      IMPLICIT REAL*8(A-H,O-Z)
      IF(N.LE.1.OR.A.GT.B) STOP 'HATALI VERI!'
      IF(MOD(N,2).EQ.1) STOP 'N SAYISI CIFT DEGIL.'
      H=(B-A)/N
      S=F(A)+F(B)
      DO 10 I=1,N-1
           X=A+I*H
           KATSAYI=2*(MOD(I,2)+1)
           S=S+KATSAYI*F(X)
10    CONTINUE
      S=S*H/3.0
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
