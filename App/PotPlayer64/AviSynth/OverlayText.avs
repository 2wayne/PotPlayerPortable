OverlayText = "PotPlayer:"+chr(13)+
	\ "----------------------------"+chr(13)+
	\ " 이 프로그램은 개인/기업/학교/관공서등 어디서나 자유롭게 설치하여"+chr(13)+
                   \ "사용이 가능합니다."+chr(13)+
	\ ""+chr(13)+
	\ "* 주의사항 "+chr(13)+
	\ " - 이 프로그램은 저작권법과 프로그램 보호법에 의해 보호를 받고 있으며"+chr(13)+
	\ " 관련 법규에서 명시적으로 허용한 제한적인 범위 이외에 본 소프트웨어"+chr(13)+
	\ " 제품을 개작하거나 리버스 엔지니어링, 디컴파일, 디스어셈블 할 수 없습니다."+chr(13)+
	\ " - 이 프로그램은 제작사의 허락없이 절대 상업적 목적으로 사용할 수 없습니다."+chr(13)+
	\ ""

potplayer_source()

t_mask = messageclip(OverlayText, width=#WIDTH, height=#HEIGHT).converttoyv12().coloryuv(levels="tv->pc").trim(0,1)
t_blank = blankclip(t_mask, color=$ffffff)

t_mask_bl = t_mask.blur(1.0).blur(1.0).blur(1.0)

overlay(last, t_mask_bl, mode="subtract")
overlay(t_blank, mode="blend", mask=t_mask)

frameevaluate("ol_x_offset = 0")
frameevaluate("ol_y_offset = #HEIGHT - (current_frame)")

fadeio(15)

return last
