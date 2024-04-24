Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AC18B0BEF
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 24 Apr 2024 16:06:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rzdGI-0004lh-K8
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 24 Apr 2024 14:06:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rzdGG-0004lR-Le
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 24 Apr 2024 14:06:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xf6jJgGtYoURMWCLwezA7KydSJS05u43a8wuFVX3hek=; b=OQh2nsKc0wRfmmQou+LbPOmdHI
 1HPN97OpvqM6UxbVys3b1OpVWT1AmCzBcr+ilcp/iDmRTbmpHbNTOlVin6BUkUjVuacjuhyFtSWcP
 J2b78lqPdZsBk5HouxHa2Z2mQvZRefq4FvVfdM0Qh1Tg/0PewS+ARtP0XxNl4RZGNzjs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xf6jJgGtYoURMWCLwezA7KydSJS05u43a8wuFVX3hek=; b=GXMc1DRpc4API5rGEEozAioTPD
 HZhDl6sTR/8wAI4dZbV+8BuDe325KXS5zQh2ZFZziawdXEQfNtWHz1+eCqSr3+Zw3IB0QfmrPNMMg
 wYj4SMPB+TbOIY7i2pYsieRvrzTTvp1FfBchZU6ZGIbyHFejneAdK1yHdC5CZ226Palo=;
Received: from mail-wr1-f45.google.com ([209.85.221.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rzdGE-0001p5-48 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 24 Apr 2024 14:06:13 +0000
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-34b3374ae22so3026102f8f.0
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 24 Apr 2024 07:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713967559; x=1714572359; darn=lists.sourceforge.net;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xf6jJgGtYoURMWCLwezA7KydSJS05u43a8wuFVX3hek=;
 b=f5Znsm0ekWX8O4A7gfLPOmEZMlUhh6fnprQCHh3wsopc+SMlIu1Fm47V3xjoP9qMi5
 0l05Tm47wY6mD843/V4bLqtlNkWWXG9kwsj8gktQ9wltsGf7rUlYSoGQYpsjf/Cfwkd7
 sevhU4trEtms9GFJ32Ku3jW6w12BrOCwnGjVq+/uC1rfb9rixU74QkT66E3HCOIK/rA3
 qIkiRcA0+NdyRJo+P53vezfNk6tt/tTooVWZlQtLmCXJ0X0oYBRRtfA6SMXDTnuO4BTw
 c327Zvv0JxCLVT1dy7V3JcuotFWj9Ab+1Ps82G7pxR9j+J/coXeH1jiLu7fw02HBeCJw
 6BrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713967559; x=1714572359;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xf6jJgGtYoURMWCLwezA7KydSJS05u43a8wuFVX3hek=;
 b=G7iQnoi6Vb6sAsQ+JO96YR1zpOiS3h1ghZIbutN9UM0vjjWOPJI5Y2cJpB/ityNA4l
 qga2cfuYiul2Ey3jIDHZ0cJeac6AQAn98YZEw5fKd9nRHyQXYrAGfCqJb5aHsPkYhiGk
 WR28mneEqgHVo+Y3hZMG+PRUqzfUyG/bkioTjYI3vqahea/i9gfr91zvOR/STFGK9m7Y
 3Pqp5b66HOXBCSGCFOLJhRC6S8AscEvl1fuYnVBYwDLtGFxH9CcYWDKEyHa+eLJJfnM8
 slZK1nfWE3NhWahPdg2maHIIKOdRQ0TiSryr7oudtvMVqDA5K4rxEDIt+GHu521yBwPn
 EnFA==
X-Gm-Message-State: AOJu0Yz3ne2AZ1auJHT9Th7ZH4dlFDzjs58fHJCyKyUO2JfQJQPoHjbE
 f+8yuxEPMgO0MojWVdjNq0yineB6wNfxstd+w4ELrsrL4s0OxqhYnNplVM6Yadk=
X-Google-Smtp-Source: AGHT+IGd68kgcf+HjE1TmNyFnjhhLSnTd0wJKFJJOgOaYKRHvfSqLflyrYYA/pJTiUGWJpppqsdsMQ==
X-Received: by 2002:adf:f1c4:0:b0:34a:5663:40b with SMTP id
 z4-20020adff1c4000000b0034a5663040bmr2105456wro.3.1713967559219; 
 Wed, 24 Apr 2024 07:05:59 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a5d48c8000000b0034af40b2efdsm9105325wrs.108.2024.04.24.07.05.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 07:05:58 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
Date: Wed, 24 Apr 2024 15:03:40 +0100
MIME-Version: 1.0
Message-Id: <20240424-kgdb_read_refactor-v3-7-f236dbe9828d@linaro.org>
References: <20240424-kgdb_read_refactor-v3-0-f236dbe9828d@linaro.org>
In-Reply-To: <20240424-kgdb_read_refactor-v3-0-f236dbe9828d@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>, 
 Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3701;
 i=daniel.thompson@linaro.org; h=from:subject:message-id;
 bh=4y/UfQeo9BB5p962BWa2HGfLqeDinyewUKR63C4ycb0=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBmKRGudf5inuoD8Nr656uwiWRZbIEHdLW4JrDeZ
 lJMHhMk9KiJAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCZikRrgAKCRB84yVdOfeI
 occbD/4pjpqPwrvEP/0VZBZncv0hccI6KG89x6KIdf9GTGF2RcxcXf908MP/MhPdHqHFBCKrIGY
 bwVl552feyjt0cvHDl0S56uvymM/PvQxvJ3Qx8Ab1xhRjlcd1VaFc3pCcJMEBFV9sLu1mr3N0wA
 aR+TyTxX3/BmHeHaveZEGP6aRDBQMn3W7tXBBleJzEA1L/8paW1XXFHgmtDSJ47IwQVcKZc4PsM
 P/B/8sISlay8zMAquHSal2ZwU0wOwMCfxv4qBsBhw2Alxvu/e+gAS529cnmSB32PLwbaysgB+rm
 v1Ydibd2VHGovJbY/waI07V1iakoEW5rirxS8CQfqR1jBlktMhovMvBvx/+fpEeMmjwlbxFFo19
 cPe/AALhutiwT+aNLLlqevg40bpOh0ZH7GsNJLAxiiO+UyH3nQzQS0UQgEEJZFu0kmVuxogQZg2
 17nnnbk1rs668oOA3XIoKzJU1Uc5EQTVu1WaU+snMQoswNX9P11elp0QaP+/8qNBE3Q2w17ucmU
 Eyqd66QjcvOnSIjunait0JmRcYstZD4ue+WcwJT54S6xdFDGWfT8K53szVurX20Zzmv4kO3ngEi
 fbe/ENy4aF9CQZ9YSZOdkXuHBeUaF81uJTxhwnkX5dMZqa+kK0V6AMNAWhPMFSwzGJUF5Yfo2GC
 /DiMt47Qrii1YYg==
X-Developer-Key: i=daniel.thompson@linaro.org; a=openpgp;
 fpr=E38BE19861669213F6E2661AA8A4E3BC5B7B28BE
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The current approach to filling tmpbuffer with completion
 candidates is confusing, with the buffer management being especially hard
 to reason about. That's because it doesn't copy the completion canid [...]
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.85.221.45 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.45 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1rzdGE-0001p5-48
Subject: [Kgdb-bugreport] [PATCH v3 7/7] kdb: Simplify management of
 tmpbuffer in kdb_read()
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
 Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

The current approach to filling tmpbuffer with completion candidates is
confusing, with the buffer management being especially hard to reason
about. That's because it doesn't copy the completion canidate into
tmpbuffer, instead of copies a whole bunch of other nonsense and then
runs the completion search from the middle of tmpbuffer!

Change this to copy nothing but the completion candidate into tmpbuffer.

Pretty much everything else in this patch is renaming to reflect the
above change:

    s/p_tmp/tmpbuffer/
    s/buf_size/sizeof(tmpbuffer)/

Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Justin Stitt <justinstitt@google.com>
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 kernel/debug/kdb/kdb_io.c | 41 ++++++++++++++++++-----------------------
 1 file changed, 18 insertions(+), 23 deletions(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 40617f36a6db4..3131334d7a81c 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -239,6 +239,7 @@ static char *kdb_read(char *buffer, size_t bufsize)
 						 * and null byte */
 	char *lastchar;
 	char *p_tmp;
+	char tmp;
 	static char tmpbuffer[CMD_BUFLEN];
 	int len = strlen(buffer);
 	int len_tmp;
@@ -246,8 +247,7 @@ static char *kdb_read(char *buffer, size_t bufsize)
 	int count;
 	int i;
 	int diag, dtab_count;
-	int key, buf_size, ret;
-
+	int key, ret;
 
 	diag = kdbgetintenv("DTABCOUNT", &dtab_count);
 	if (diag)
@@ -329,21 +329,16 @@ static char *kdb_read(char *buffer, size_t bufsize)
 	case 9: /* Tab */
 		if (tab < 2)
 			++tab;
-		p_tmp = buffer;
-		while (*p_tmp == ' ')
-			p_tmp++;
-		if (p_tmp > cp)
-			break;
-		memcpy(tmpbuffer, p_tmp, cp-p_tmp);
-		*(tmpbuffer + (cp-p_tmp)) = '\0';
-		p_tmp = strrchr(tmpbuffer, ' ');
-		if (p_tmp)
-			++p_tmp;
-		else
-			p_tmp = tmpbuffer;
-		len = strlen(p_tmp);
-		buf_size = sizeof(tmpbuffer) - (p_tmp - tmpbuffer);
-		count = kallsyms_symbol_complete(p_tmp, buf_size);
+
+		tmp = *cp;
+		*cp = '\0';
+		p_tmp = strrchr(buffer, ' ');
+		p_tmp = (p_tmp ? p_tmp + 1 : buffer);
+		strscpy(tmpbuffer, p_tmp, sizeof(tmpbuffer));
+		*cp = tmp;
+
+		len = strlen(tmpbuffer);
+		count = kallsyms_symbol_complete(tmpbuffer, sizeof(tmpbuffer));
 		if (tab == 2 && count > 0) {
 			kdb_printf("\n%d symbols are found.", count);
 			if (count > dtab_count) {
@@ -355,14 +350,14 @@ static char *kdb_read(char *buffer, size_t bufsize)
 			}
 			kdb_printf("\n");
 			for (i = 0; i < count; i++) {
-				ret = kallsyms_symbol_next(p_tmp, i, buf_size);
+				ret = kallsyms_symbol_next(tmpbuffer, i, sizeof(tmpbuffer));
 				if (WARN_ON(!ret))
 					break;
 				if (ret != -E2BIG)
-					kdb_printf("%s ", p_tmp);
+					kdb_printf("%s ", tmpbuffer);
 				else
-					kdb_printf("%s... ", p_tmp);
-				*(p_tmp + len) = '\0';
+					kdb_printf("%s... ", tmpbuffer);
+				tmpbuffer[len] = '\0';
 			}
 			if (i >= dtab_count)
 				kdb_printf("...");
@@ -373,14 +368,14 @@ static char *kdb_read(char *buffer, size_t bufsize)
 				kdb_position_cursor(kdb_prompt_str, buffer, cp);
 		} else if (tab != 2 && count > 0) {
 			/* How many new characters do we want from tmpbuffer? */
-			len_tmp = strlen(p_tmp) - len;
+			len_tmp = strlen(tmpbuffer) - len;
 			if (lastchar + len_tmp >= bufend)
 				len_tmp = bufend - lastchar;
 
 			if (len_tmp) {
 				/* + 1 ensures the '\0' is memmove'd */
 				memmove(cp+len_tmp, cp, (lastchar-cp) + 1);
-				memcpy(cp, p_tmp+len, len_tmp);
+				memcpy(cp, tmpbuffer+len, len_tmp);
 				kdb_printf("%s", cp);
 				cp += len_tmp;
 				lastchar += len_tmp;

-- 
2.43.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
