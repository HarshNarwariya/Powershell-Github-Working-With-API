c l a s s   G i t h u b {           [ s t r i n g ] $ u s e r n a m e ;           [ s t r i n g ] $ t o k e n ;           [ o b j e c t ] $ h e a d e r s   =   @ { } ;           [ s t r i n g ] $ U r i   =   " h t t p s : / / a p i . g i t h u b . c o m " ;           [ a r r a y ] $ r e p o D e t a i l s   =   @ (                   " n a m e " ,                   " p r i v a t e " ,                     " d e s c r i p t i o n " ,                     " c r e a t e d _ a t " ,                     " p u s h e d _ a t " ,                     " u p d a t e d _ a t "           ) ;           $ e r r o r P a r t ;           $ d a t a ;           $ l a s t S e a r c h ;           $ s h a ;             g i t h u b ( [ s t r i n g ] $ u s e r n a m e ,   [ s t r i n g ] $ t o k e n ) {                   $ t h i s . u s e r n a m e   =   $ u s e r n a m e ;                   $ t h i s . t o k e n         =   $ t o k e n ;                   $ t h i s . s e t H e a d e r ( " A u t h o r i z a t i o n " ,   " t o k e n   { 0 } "   - f   $ t h i s . t o k e n ) ;           }             s e t H e a d e r ( [ s t r i n g ] $ k e y ,   [ s t r i n g ] $ v a l u e ) {                   $ t h i s . h e a d e r s . a d d ( $ k e y ,   $ v a l u e ) ;           }             r e m o v e H e a d e r ( [ s t r i n g ] $ k e y ) {                   $ t h i s . h e a d e r s . R e m o v e ( $ k e y ) ;           }             r e s e t H e a d e r s ( ) {                   $ t h i s . h e a d e r s   =   @ { } ;           }             g e t R e p o ( [ s t r i n g ] $ r e p o N a m e ) {                   t r y {                           $ u r l   =   " { 0 } / r e p o s / { 1 } / { 2 } "   - f   $ t h i s . U r i ,   $ t h i s . u s e r n a m e ,   $ r e p o N a m e ;                           W r i t e - H o s t   " F e t c h i n g :   $ u r l   ` n " ;                           $ t h i s . d a t a   =   I n v o k e - R e s t M e t h o d   - U r i   $ u r l   - M e t h o d   G e t   - H e a d e r s   $ t h i s . h e a d e r s ;                           $ t h i s . s h o w D e t a i l s ( $ t h i s . d a t a ,   $ t h i s . r e p o D e t a i l s ) ;                   } c a t c h {                           $ t h i s . e r r o r P a r t   =   $ _ ;                           $ t h i s . s h o w L a s t E r r o r ( ) ;                   }           }                     l i s t R e p o ( ) {                   t r y {                           $ u r l   =   " { 0 } / s e a r c h / r e p o s i t o r i e s ? q = u s e r : { 1 } "   - f   $ t h i s . U r i ,   $ t h i s . u s e r n a m e ;                           W r i t e - H o s t   " F e t c h i n g :   $ u r l   ` n " ;                           $ t h i s . d a t a   =   I n v o k e - R e s t M e t h o d   - U r i   $ u r l   - M e t h o d   G e t   - H e a d e r s   $ t h i s . h e a d e r s ;                           f o r e a c h ( $ r e p o   i n   $ t h i s . d a t a . i t e m s ) {                                   W r i t e - H o s t   " ` n - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - " ;                                   $ t h i s . s h o w D e t a i l s ( $ r e p o ,   $ t h i s . r e p o D e t a i l s ) ;                                                             }                   } c a t c h {                           $ t h i s . e r r o r P a r t   =   $ _ ;                           $ t h i s . s h o w L a s t E r r o r ( ) ;                   }           }             c r e a t e F i l e ( $ r e p o N a m e ,   $ l o c a l F i l e P a t h ,   $ P a t h T o f i l e ,   $ m e s s a g e ) {                   t r y {                           $ u r l   =   " h t t p s : / / a p i . g i t h u b . c o m / r e p o s / { 0 } / { 1 } / c o n t e n t s / { 2 } "   - f   $ t h i s . u s e r n a m e ,   $ r e p o N a m e ,   $ P a t h T o f i l e ;                           W r i t e - H o s t   " R e a d i n g   F i l e   C o n t e n t . . "   - f   B l a c k   - b   G r e e n ;                           $ b o d y   =   @ {                                   c o n t e n t   =   $ t h i s . b a s e 6 4 ( ( G e t - C o n t e n t   $ l o c a l F i l e P a t h ) )                                   m e s s a g e   =   $ m e s s a g e                           }   |   C o n v e r t T o - J s o n                           W r i t e - H o s t   " S e n d i n g . . . "   - f   B l a c k   - b   G r e e n ;                           $ t h i s . d a t a   =   I n v o k e - R e s t M e t h o d   $ u r l   - H e a d e r s   $ t h i s . h e a d e r s   - M e t h o d   P u t   - B o d y   $ b o d y ;                   }   c a t c h   {                           $ t h i s . e r r o r P a r t   =   $ _ ;                           $ t h i s . s h o w L a s t E r r o r ( ) ;                   }           }             u p d a t e F i l e ( $ r e p o N a m e ,   $ l o c a l F i l e P a t h ,   $ P a t h T o f i l e ,   $ m e s s a g e ) {                   t r y {                           $ u r l   =   " h t t p s : / / a p i . g i t h u b . c o m / r e p o s / { 0 } / { 1 } / c o n t e n t s / { 2 } "   - f   $ t h i s . u s e r n a m e ,   $ r e p o N a m e ,   $ P a t h T o f i l e ;                           W r i t e - H o s t   " C h e c k i n g   U p d a t e d . .   $ u r l "   - f   B l a c k   - b   G r e e n ;                           $ c o n t e n t   =   $ t h i s . b a s e 6 4 ( ( G e t - C o n t e n t   $ l o c a l F i l e P a t h ) ) ;                           $ t h i s . d a t a   =   I n v o k e - R e s t M e t h o d   $ u r l   - H e a d e r s   $ t h i s . h e a d e r s ;                           i f ( $ c o n t e n t   - e q   $ t h i s . d a t a . c o n t e n t ) {                                   W r i t e - H o s t   " C h a n g e s   N o t   F o u n d ! "   - f   R e d   - b   B l a c k ;                           }                           e l s e {                                   $ b o d y   =   @ {                                           c o n t e n t   =   $ c o n t e n t                                           m e s s a g e   =   $ m e s s a g e                                           s h a           =   $ t h i s . d a t a . s h a                                   }   |   C o n v e r t T o - J s o n                                   W r i t e - H o s t   " S e n d i n g . . . "   - f   B l a c k   - b   G r e e n ;                                   $ t h i s . d a t a   =   I n v o k e - R e s t M e t h o d   $ u r l   - H e a d e r s   $ t h i s . h e a d e r s   - M e t h o d   P u t   - B o d y   $ b o d y ;                           }                   }   c a t c h   {                           $ t h i s . e r r o r P a r t   =   $ _ ;                           $ t h i s . s h o w L a s t E r r o r ( ) ;                   }           }                     d e l e t e F i l e ( $ r e p o N a m e ,   $ P a t h T o f i l e ,   $ m e s s a g e ) {                   t r y {                           $ u r l   =   " h t t p s : / / a p i . g i t h u b . c o m / r e p o s / { 0 } / { 1 } / c o n t e n t s / { 2 } "   - f   $ t h i s . u s e r n a m e ,   $ r e p o N a m e ,   $ P a t h T o f i l e ;                           W r i t e - H o s t   " C h e c k i n g   F i l e . . .   $ u r l "   - f   B l a c k   - b   G r e e n ;                           $ t h i s . d a t a   =   I n v o k e - R e s t M e t h o d   $ u r l   - H e a d e r s   $ t h i s . h e a d e r s ;                           $ b o d y   =   @ {                                   m e s s a g e   =   $ m e s s a g e                                   s h a           =   $ t h i s . d a t a . s h a                           }   |   C o n v e r t T o - J s o n                                   W r i t e - H o s t   " D e l e t i n g   F i l e . . . "   - f   B l a c k   - b   G r e e n ;                                   $ t h i s . d a t a   =   I n v o k e - R e s t M e t h o d   $ u r l   - H e a d e r s   $ t h i s . h e a d e r s   - M e t h o d   D E L E T E   - B o d y   $ b o d y ;                                             }   c a t c h   {                           $ t h i s . e r r o r P a r t   =   $ _ ;                           $ t h i s . s h o w L a s t E r r o r ( ) ;                   }           }             d o w n l o a d F i l e ( $ r e p o N a m e ,   $ f i l e P a t h ,   $ l o c a l P a t h T o S a v e F i l e ) {                   t r y {                           $ u r l   =   " h t t p s : / / r a w . g i t h u b u s e r c o n t e n t . c o m / { 0 } / { 1 } / m a i n / { 2 } "   - f   $ t h i s . u s e r n a m e ,   $ r e p o N a m e ,   $ f i l e P a t h ;                           W r i t e - H o s t   " D o w n l o a d i n g . . . "   - f   G r e e n ;                           I n v o k e - W e b R e q u e s t   - U r i   $ u r l   - O u t F i l e   $ l o c a l P a t h T o S a v e F i l e   - H e a d e r s   $ t h i s . h e a d e r s                   } c a t c h {                           W r i t e - H o s t   $ _ ;                   }           }             c r e a t e R e p o ( [ s t r i n g ] $ n a m e ,   [ b o o l e a n ] $ p r i v a t e ,   [ s t r i n g ] $ d e s c r i p t i o n ) {                   t r y {                           $ u r l   =   " { 0 } / u s e r / r e p o s "   - f   $ t h i s . U r i ;                           $ b o d y   =   @ {                                   " n a m e "   =   $ n a m e                                   " d e s c r i p t i o n "   =   $ d e s c r i p t i o n                                   " p r i v a t e "   =   $ p r i v a t e                                   " a u t o _ i n i t "   =   $ t r u e ;                           }   |   C o n v e r t T o - J s o n                           W r i t e - H o s t   " S e n d i n g :   $ u r l   ` n " ;                           $ t h i s . d a t a   =   I n v o k e - R e s t M e t h o d   - U r i   $ u r l   - M e t h o d   P o s t   - H e a d e r s   $ t h i s . h e a d e r s   - B o d y   $ b o d y ;                   } c a t c h   {                           $ t h i s . e r r o r P a r t   =   $ _ ;                           $ t h i s . s h o w L a s t E r r o r ( ) ;                   }           }             d e l e t e R e p o ( [ s t r i n g ] $ n a m e ) {                   t r y {                           $ u r l   =   " { 0 } / r e p o s / { 1 } / { 2 } "   - f   $ t h i s . U r i ,   $ t h i s . u s e r n a m e ,   $ n a m e ;                           W r i t e - H o s t   " D e l e t i n g :   $ u r l   ` n " ;                           $ t h i s . d a t a   =   I n v o k e - R e s t M e t h o d   - U r i   $ u r l   - M e t h o d   D e l e t e   - H e a d e r s   $ t h i s . h e a d e r s ;                   }   c a t c h   {                           $ t h i s . e r r o r P a r t   =   $ _ ;                           $ t h i s . s h o w L a s t E r r o r ( ) ;                   }           }             l i s t F i l e s o f R e p o ( [ s t r i n g ] $ n a m e ) {                   t r y {                           $ u r l   =   " { 0 } / r e p o s / { 1 } / { 2 } / c o n t e n t s "   - f   $ t h i s . U r i ,   $ t h i s . u s e r n a m e ,   $ n a m e ;                           W r i t e - H o s t   " F e t c h i n g :   $ u r l   ` n " ;                           $ t h i s . d a t a   =   I n v o k e - R e s t M e t h o d   - U r i   $ u r l   - M e t h o d   G e t   - H e a d e r s   $ t h i s . h e a d e r s ;                           f o r e a c h ( $ d e t a i l s   i n   $ t h i s . d a t a ) {                                   i f ( $ d e t a i l s . t y p e   - e q   " d i r " ) {                                           $ m e s s a g e   =   " { 0 } "   - f   $ d e t a i l s . n a m e ;                                           W r i t e - H o s t   $ m e s s a g e   - f   Y e l l o w   - b   B l a c k ;                                           $ t h i s . i t e r F o l d e r ( $ u r l ,   $ d e t a i l s . p a t h ,   "     " ) ;                                   }                                   e l s e {                                           $ m e s s a g e   =   " { 0 }   :   { 1 } "   - f   $ d e t a i l s . n a m e ,   $ d e t a i l s . s i z e ;                                           W r i t e - H o s t   $ m e s s a g e   - f   G r e e n   - b   B l a c k ;                                   }                           }                   }   c a t c h   {                           $ t h i s . e r r o r P a r t   =   $ _ ;                           $ t h i s . s h o w L a s t E r r o r ( ) ;                   }           }             i t e r F o l d e r ( $ u r l ,   $ f o l d e r N a m e ,   $ t a b ) {                   $ t a b   + =   $ t a b ;                   $ u r l _   =   $ u r l   +   " / "   +   $ f o l d e r N a m e                   $ _ d a t a   =   I n v o k e - R e s t M e t h o d   - U r i   $ u r l _   - M e t h o d   G e t   - H e a d e r s   $ t h i s . h e a d e r s ;                           f o r e a c h ( $ d e t a i l s   i n   $ _ d a t a ) {                                   i f ( $ d e t a i l s . t y p e   - e q   " d i r " ) {                                           $ m e s s a g e   =   " { 0 } "   - f   $ d e t a i l s . n a m e ;                                           W r i t e - H o s t   " $ t a b   $ m e s s a g e "   - f   Y e l l o w   - b   B l a c k ;                                           $ t h i s . i t e r F o l d e r ( $ u r l ,   $ d e t a i l s . p a t h ,   $ t a b ) ;                                   }                                   e l s e {                                           $ m e s s a g e   =   " { 0 }   :   { 1 } "   - f   $ d e t a i l s . n a m e ,   $ d e t a i l s . s i z e ;                                           W r i t e - H o s t   " $ t a b   $ m e s s a g e "   - f   G r e e n   - b   B l a c k ;                                   }                           }           }             s h o w L a s t E r r o r ( ) {                   i f ( $ t h i s . e r r o r P a r t ) {                           W r i t e - H o s t   " S t a t u s C o d e : "   $ t h i s . e r r o r P a r t . E x c e p t i o n . R e s p o n s e . S t a t u s C o d e . v a l u e _ _ ;                           W r i t e - H o s t   " S t a t u s D e s c r i p t i o n : "   $ t h i s . e r r o r P a r t . E x c e p t i o n . R e s p o n s e . S t a t u s D e s c r i p t i o n ;                   }                   e l s e {                           W r i t e - H o s t   " N o   E r r o r   F o u n d " ;                   }           }             [ s t r i n g ] b a s e 6 4 ( $ c o n t e n t ) {                   $ b y t e s   =   [ S y s t e m . T e x t . E n c o d i n g ] : : U n i c o d e . G e t B y t e s ( $ c o n t e n t ) ;                   r e t u r n   [ C o n v e r t ] : : T o B a s e 6 4 S t r i n g ( $ b y t e s ) ;           }             s h o w D e t a i l s ( $ r e p o ,   $ i n f o ) {                   f o r e a c h   ( $ k e y   i n   $ i n f o ) {                           $ m e s s a g e   =   " { 0 } :   { 1 } "   - f   $ k e y ,   $ r e p o . $ k e y ;                           i f   ( $ k e y   - e q   " n a m e " ) {                                   W r i t e - H o s t   $ m e s s a g e   - b   B l a c k   - f   Y e l l o w ;                           }                           e l s e {                                   W r i t e - H o s t   $ m e s s a g e   - b   B l a c k   - f   G r e e n ;                           }                   }           }   }     $ t o k e n   =   " g h p _ M G g k 9 c W e p s O U 5 K r 8 x 9 e 9 P 2 8 L E 4 I Y J Y 4 Q Q 1 L p " ;   [ G i t h u b ] $ g i t h u b   =   [ G i t h u b ] : : n e w ( " H a r s h N a r w a r i y a " ,   $ t o k e n ) ; 