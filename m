Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D072B8B0BED
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 24 Apr 2024 16:06:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rzdGH-0003Da-65
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 24 Apr 2024 14:06:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rzdGC-0003DG-9R
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 24 Apr 2024 14:06:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wTP9sloie88dSAOWvNZGscW0v0fJi60UyTt3HwL6Nts=; b=YHkJLJlkKtQHhNJn122lwTnL6O
 HOW8h4Dh1QkfU5dz355HeeSHQNKqRs+WHoyaVVwV+Qsg3B358yYrkgggnboSe7KlFA62oAW8+ZlXM
 nuaEeZ40ichuMg7YO22Ybv/M4KWWdHc5DVDzXP1MKcVOk8ib3CSc2YlALwVHgOYp/DAM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wTP9sloie88dSAOWvNZGscW0v0fJi60UyTt3HwL6Nts=; b=iztm2/Js7otiTHWhUbJoc8JOTd
 8iU8GwFOdD3Ny9ek946Ti9uRYnvKU+R90xBvg6pImwiDHyqwDntFyIxbxPU8iorjcsMcr76YbfuSF
 SvxaL1PXk0qf2ta9w9VV0bckl5r+fyu+nJ5MZtqjoU22T0qN79TgeE9lFO6G1gIjBr4M=;
Received: from mail-wr1-f41.google.com ([209.85.221.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rzdGA-0001og-8k for kgdb-bugreport@lists.sourceforge.net;
 Wed, 24 Apr 2024 14:06:08 +0000
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-343d7ff2350so5248136f8f.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 24 Apr 2024 07:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713967555; x=1714572355; darn=lists.sourceforge.net;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wTP9sloie88dSAOWvNZGscW0v0fJi60UyTt3HwL6Nts=;
 b=Xq8KqKdqQws64bDMu+wylsqgwOP3rhWuJENditEDdNOadILQeHkLtAbrCPlFuGGRfV
 8Ei0/43oyot5bpJejzWcoc6T2JRaflpsCX3u4dlfs+B3EPFj2q0n42BvtwNwTvYt7wfg
 yhlyuHzx/TIl/QyzGAnNBc67kpqTXsjottiHMf+GyJmaybHmnXfEIVc0gO6FTk0cPo+w
 xsOlx/UyjzI5YPOP+SVbf01HFXFpRjfVMXKtf6fdL9DXN0R49jMy4WcirXZ7HXu+t/iF
 Eh1VOGOgHNgxcHyRBWHjwQvaT+s05O3xRs0vpRpBs0UiZI6tLgk7dSGBOK1RJeDzXmVg
 EKTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713967555; x=1714572355;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wTP9sloie88dSAOWvNZGscW0v0fJi60UyTt3HwL6Nts=;
 b=COdeZOBjiZ8SWV69pO9gw7wKAClBtqOWMSQCYqs6pFz9kmPXcrP9gExrtgWYeTyp/O
 ZUmriYfcH9CavfQLIVRsywhamqihfoGE1mSyhuPFZCFJF/emHA+a0zi+1vmkhLEGEX3Y
 hydIU43pIgFVBYfJthWYo0Lq1J6k6CZS10crtx5Zdh4w0c26f3B54wBNdb6HuEDAO7Pt
 NOGtxCRnOK5FqgXYynPah2NHDuz9lRuyC8w1ke5NS2tncDPuHj3iMnyJmjWJgcPpfccp
 7wel0IttUIyHhWyCT8dmeV+sAKwnlLdotojPYJ9jRlsCHyrvaoFeJREp/x3S/K4x8iRx
 soLA==
X-Gm-Message-State: AOJu0Yw50FilhcvqybKNE9k6iXY9l8qKM78dF2fKi7IYrZcxwOyGzlzo
 ChoMGhdKuB8h6EfT0IGiNp1Wl0xxv7OUDO9GCXlXtbE72iSzzUPTgFV/m4LqCv14OnUOb0lFj2w
 jqz8=
X-Google-Smtp-Source: AGHT+IEPX+Xxot+imSpOcgmGXIlR2aQ/wmTSkNDbehn8kMSExZwzE+2IRDZ83atLmZU3x+oYV22avw==
X-Received: by 2002:adf:fd05:0:b0:347:70ce:acbe with SMTP id
 e5-20020adffd05000000b0034770ceacbemr1867171wrr.67.1713967555393; 
 Wed, 24 Apr 2024 07:05:55 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a5d48c8000000b0034af40b2efdsm9105325wrs.108.2024.04.24.07.05.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 07:05:54 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
Date: Wed, 24 Apr 2024 15:03:37 +0100
MIME-Version: 1.0
Message-Id: <20240424-kgdb_read_refactor-v3-4-f236dbe9828d@linaro.org>
References: <20240424-kgdb_read_refactor-v3-0-f236dbe9828d@linaro.org>
In-Reply-To: <20240424-kgdb_read_refactor-v3-0-f236dbe9828d@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>, 
 Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1374;
 i=daniel.thompson@linaro.org; h=from:subject:message-id;
 bh=rg+wVmfYkRGv9/2I6H3Tms0eU7TpUVK8/Yo0BHNg5Cg=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBmKRGGUIqVKrOdXwYeS3cqs6ybpiHvyFYQnDNDX
 wKlZXU4yfOJAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCZikRhgAKCRB84yVdOfeI
 obU+EACP6jy9g//wnAmPJ7pvsIGCksOaTaiCmuiV6HeoRkqrYb/8LXKinX2ulqQtBlzx/m3gj/1
 r903vaASLGgIfcByimnXKvcBwOWOKSCtf7hg+Pdz3H6UPCSHLi09U4EjXe4Z0Q7KmX+rpHHt4Rm
 cXCJDQw6Oi6GThI2/YK4ZU2AXlxUwH7EscpSbEJSDljvRzqTkCFIGUo/NhMhpAyB2MEK+GuftBT
 CcrpGKerGJGD9X/I/YPLD1r8PMxTXMPSiWJpJWttiy45HQiX2ziL42syJibH2kb84KjzQbgXOt6
 0puhYjeHPcK1L14d051++9Cp+bdKdhPuDLY6X5wjKHTY2rFW06Ms0wwIzE/QIrXwT+t3J6KKW+w
 66Zxi6Bm6O15lrO5AlEXAQL7eCNIMWmIuUHWXP3iihytoXvwViLOWQ6A5BVeG5cu+F/r95czqdj
 QYiOJ8A06T6q2kI/f7WVIh+NU0AUJSQu0Pna52M+mJHAmymxRQUDrs/aDXncVh/pRgS6hiBIqpq
 36eHXGO6Ykh7SoLQRVzmkpbbKQ+aXLMcL0PAy0GdvDJGYqcvWtRxEXmSrfF0rwYJnBKhuXA0Ah5
 gAqwsPthBijNpxOESrNb7XMHsUvEaDHlcuzeKwkpcTO7wTFuiOB7GfjdTniKGz9JXyoDCmVisXR
 sF37CLSCUj/j3YA==
X-Developer-Key: i=daniel.thompson@linaro.org; a=openpgp;
 fpr=E38BE19861669213F6E2661AA8A4E3BC5B7B28BE
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The code that handles case 14 (down) and case 16 (up) has
 been copy and pasted despite being byte-for-byte identical. Combine them.
 Cc: stable@vger.kernel.org # Not a bug fix but it is needed for later bug
 fixes Reviewed-by: Douglas Anderson <dianders@chromium.org> Tested-by: Justin
 Stitt <justinstitt@google.com> Signed-off-by: Da [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [209.85.221.41 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.41 listed in wl.mailspike.net]
X-Headers-End: 1rzdGA-0001og-8k
Subject: [Kgdb-bugreport] [PATCH v3 4/7] kdb: Merge identical case
 statements in kdb_read()
X-BeenThere: kgdb-bugreport@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: kgdb bugs suggestions <kgdb-bugreport.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=kgdb-bugreport>
List-Post: <mailto:kgdb-bugreport@lists.sourceforge.net>
List-Help: <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport>, 
 <mailto:kgdb-bugreport-request@lists.sourceforge.net?subject=subscribe>
Cc: kgdb-bugreport@lists.sourceforge.net,
 Daniel Thompson <daniel.thompson@linaro.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

The code that handles case 14 (down) and case 16 (up) has been copy and
pasted despite being byte-for-byte identical. Combine them.

Cc: stable@vger.kernel.org # Not a bug fix but it is needed for later bug fixes
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Justin Stitt <justinstitt@google.com>
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 kernel/debug/kdb/kdb_io.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 5fccb46f399e5..a73779529803f 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -317,6 +317,7 @@ static char *kdb_read(char *buffer, size_t bufsize)
 		}
 		break;
 	case 14: /* Down */
+	case 16: /* Up */
 		memset(tmpbuffer, ' ',
 		       strlen(kdb_prompt_str) + (lastchar-buffer));
 		*(tmpbuffer+strlen(kdb_prompt_str) +
@@ -331,15 +332,6 @@ static char *kdb_read(char *buffer, size_t bufsize)
 			++cp;
 		}
 		break;
-	case 16: /* Up */
-		memset(tmpbuffer, ' ',
-		       strlen(kdb_prompt_str) + (lastchar-buffer));
-		*(tmpbuffer+strlen(kdb_prompt_str) +
-		  (lastchar-buffer)) = '\0';
-		kdb_printf("\r%s\r", tmpbuffer);
-		*lastchar = (char)key;
-		*(lastchar+1) = '\0';
-		return lastchar;
 	case 9: /* Tab */
 		if (tab < 2)
 			++tab;

-- 
2.43.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
