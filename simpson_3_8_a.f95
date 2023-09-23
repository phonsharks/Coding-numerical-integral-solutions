PROGRAM simpson3_8rule
IMPLICIT NONE
REAL::x0,xn,h,f,y
INTEGER::i,n
PRINT*,"ENTER VALUES OF x0,xn and no. of subintervals n"
READ*, x0,xn,n
h=(xn-x0)/n

           IF(MOD(n,3)==0)THEN
           y=f(x0)+f(xn)

           DO i=1,n-1
              IF(mod(i,3)/=0)THEN
              y=y+3*f(x0+i*h)
              ELSE
              y=y+2*f(x0+i*h)
              ENDIF
           END DO

y=(y*3*h)/8

PRINT*,"VALUE OF INTEGRAL IS =",y
              ELSE
              PRINT*,"NO. INTERVAL SHOULD BE MULTIPLE OF 3"
              ENDIF
pause
END PROGRAM simpson3_8rule

REAL FUNCTION f(x)
IMPLICIT NONE
REAL::x
f=1./(1+x**2)
END FUNCTION 
