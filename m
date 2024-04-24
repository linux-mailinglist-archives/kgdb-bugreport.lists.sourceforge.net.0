Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 70BD28B0BE9
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 24 Apr 2024 16:06:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rzdGA-0004kX-MV
	for lists+kgdb-bugreport@lfdr.de;
	Wed, 24 Apr 2024 14:06:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rzdG9-0004kM-6f
 for kgdb-bugreport@lists.sourceforge.net;
 Wed, 24 Apr 2024 14:06:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DpHsNOkxngtvba9wSq++zmIn8As88KCaI91fFzXimkg=; b=VHzYUhUXTykqO5QLyn+HdvgIPa
 WNQcuBoFaYqQmjFFdpJba6oz/Hc4zEhhfCabAt8po02ECxu4hMToic0MVJ2tPt9MYmCtiC8iwca6J
 ffTLBFLY4lSfIw4x+Iefd/geTSvN5dTX6U3RiwlPf3OuZ2y8SEKD1mpEgj+0IN/DYsaM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DpHsNOkxngtvba9wSq++zmIn8As88KCaI91fFzXimkg=; b=cLi9Tfn+ZLQ4MR7sGl8urbdDJm
 FW6y5Lifm+wLdgRrTPb/FRoxxDlkZGfa14onS4Ak6UFL+bQYeIssTmlUIqJ1l7nTONCrvs97riTW4
 FeCOlZlcHP58vmold72mjRMQjmZfyDQ2SkdDsBboRJnkCq2sx+ifcoXt1e8ENCGRQRrs=;
Received: from mail-wr1-f50.google.com ([209.85.221.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rzdG6-0001oY-OA for kgdb-bugreport@lists.sourceforge.net;
 Wed, 24 Apr 2024 14:06:05 +0000
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-349545c3eb8so5040085f8f.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 24 Apr 2024 07:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713967552; x=1714572352; darn=lists.sourceforge.net;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DpHsNOkxngtvba9wSq++zmIn8As88KCaI91fFzXimkg=;
 b=Oz2dss67kfWRd9nNR4DaHLQEMqBFp+O8vqEjTf2XuusIhBxQDpsQTjOcOKWTRwCnSa
 BBM3UiSBieOCMRRmGTuoseEQSEn//8uJ4dF49M8kbEdbZYigQkodB0lwrFUDwOnWjD9n
 EQvHdxwr+3ZuOzsQ7IeE7eKb7ep18MIJoxp+xMBwlkFsjEQxEEvYxzSaSuMD4IThFkCT
 vgfzspGfcRkQSBl+TEg7lr+cBQfErp88rS5dRGNRfsggbxeRkWLck6bCuzONNzMC9jR5
 NHZpjJU0t/IdhCxTwL40UopXw/kD2q1nuw1CyUsWmIZrGOf15+yNT3hxi7y+JF2XqGxW
 A9WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713967552; x=1714572352;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DpHsNOkxngtvba9wSq++zmIn8As88KCaI91fFzXimkg=;
 b=rC39QoE3zZDXme3vpA8e7WFLPPpYjfwbq6w1PZnACulorT7J4YERD2XTgv4FaN+4vX
 yU6wjPWs1/KRaK/n7v8ur30XskH/q8Tc1UrRxh0CJ2mZA9imznMFgAKpxc8lTHR5oroK
 wmf3rueczoYR1qfBBJw/D1+ZjC5gzW3SIMOpjJnoQwL9ogXD/6eXhZ9A4Mm/j/U8tQ6H
 1z27nThKtfG8+H323sLNPLeqf1aEF0OEF4o2nrXfoZlJYKHNHM/KdJvkOleXdwPHQsnq
 BOdedlvsQqnaOn3mxfygRWXtrt+BbUFEari86Rj8kJHZZQFrhIvenmsOVfiRknoW6hjl
 MeDw==
X-Gm-Message-State: AOJu0YxRtynmeo9m2RZKi7jfQR3uCSv2fdutUJnn0qWu32IM02dOoiL8
 Nu/rPCDOk7R005BbSMDRNADzQmbs/fOR+MGUCO2+Vt/3cAW+E36alzEXdZ8P27OIWH3rWJ2vDdm
 APa8=
X-Google-Smtp-Source: AGHT+IHrPrgSzW/eVw7jFZHVPCK2stE2i1eZs6gOPOq9XnTtiiffxLzlqTup/NIJDSvunaQRTGqq7w==
X-Received: by 2002:a5d:574a:0:b0:34a:e73a:56a3 with SMTP id
 q10-20020a5d574a000000b0034ae73a56a3mr1627330wrw.7.1713967551890; 
 Wed, 24 Apr 2024 07:05:51 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 p8-20020a5d48c8000000b0034af40b2efdsm9105325wrs.108.2024.04.24.07.05.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Apr 2024 07:05:50 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
Date: Wed, 24 Apr 2024 15:03:35 +0100
MIME-Version: 1.0
Message-Id: <20240424-kgdb_read_refactor-v3-2-f236dbe9828d@linaro.org>
References: <20240424-kgdb_read_refactor-v3-0-f236dbe9828d@linaro.org>
In-Reply-To: <20240424-kgdb_read_refactor-v3-0-f236dbe9828d@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>, 
 Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4021;
 i=daniel.thompson@linaro.org; h=from:subject:message-id;
 bh=pUuir1uu0AsFezKSVWCJ+HLjIqUcc98HfYuUzHwdnik=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBmKRFrh6HPOcCklaq0yycGzE/JCVXYmszt3a2b3
 ez4yq9phveJAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCZikRawAKCRB84yVdOfeI
 oSo0D/0ap+RFd7GQkBARE2EvV7WKwb/s+o03JffFP+H5p7ja6NtXnZxw2vCbIgxiEa+SiqrfVGg
 yzaB8XzeG7cYtdaPgecedLfh5K1TbOsl+XwTvaLmIGC5Xtm607+HG+lGv327PjwGX+0pFns5tOM
 wRUYTWBHJel5K4vQbkNlCGBEiofmusoJysKAVhfDZ7lV23MoO5IYJ2LK+1et6dyHVcadeAYRqkS
 jpgJN81La4V6lDejD5wttUylt2l7nxsrjvVcydVhXPGxY7ZWgZRHC05DzLJePM+hQKANEeUDaqh
 mOyeA0tZKEUMftyKX3C/iwVUoSEvjJrgdgNC930zDugN162bUIj+yz2rqXjNmCZHh+rjEuYNDKZ
 5zlUw61uA1i3xJQifNTedO1YL0lS/+IurpfQ+XAiGBzUC2QadU5uA4OPk3ehLGWmo1AXEZ70ozV
 jMHZYX5KxbecN4V9KZh8p1D6cahJN2HLZ5oOeIp3jjv0GD3Bl+QQo2mIq1JRmfyliCm76mm3VRB
 j5hqskDS1vzo9kahcpwK4TPVe5R0Y1iaA+K86culQYQ2FSDbywkV9L3WGZvpUFCsMpVoqD5A59x
 Lv+9LXP2hbo4wVaObNRyx6vwMVhzAeXQjJKrF8pcn8kb6Q/Zp6wh65Gv0yoQ0kzy6R3Ej0Fib/h
 bqSnTUTmJdvcI6Q==
X-Developer-Key: i=daniel.thompson@linaro.org; a=openpgp;
 fpr=E38BE19861669213F6E2661AA8A4E3BC5B7B28BE
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Currently when kdb_read() needs to reposition the cursor it
 uses copy and paste code that works by injecting an '\0' at the cursor
 position
 before delivering a carriage-return and reprinting the line [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.85.221.50 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.50 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1rzdG6-0001oY-OA
Subject: [Kgdb-bugreport] [PATCH v3 2/7] kdb: Use format-strings rather than
 '\0' injection in kdb_read()
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

Currently when kdb_read() needs to reposition the cursor it uses copy and
paste code that works by injecting an '\0' at the cursor position before
delivering a carriage-return and reprinting the line (which stops at the
'\0').

Tidy up the code by hoisting the copy and paste code into an appropriately
named function. Additionally let's replace the '\0' injection with a
proper field width parameter so that the string will be abridged during
formatting instead.

Cc: stable@vger.kernel.org # Not a bug fix but it is needed for later bug fixes
Tested-by: Justin Stitt <justinstitt@google.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 kernel/debug/kdb/kdb_io.c | 55 +++++++++++++++++++++++++++++------------------
 1 file changed, 34 insertions(+), 21 deletions(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 06dfbccb10336..50789c99b3ba8 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -184,6 +184,33 @@ char kdb_getchar(void)
 	unreachable();
 }
 
+/**
+ * kdb_position_cursor() - Place cursor in the correct horizontal position
+ * @prompt: Nil-terminated string containing the prompt string
+ * @buffer: Nil-terminated string containing the entire command line
+ * @cp: Cursor position, pointer the character in buffer where the cursor
+ *      should be positioned.
+ *
+ * The cursor is positioned by sending a carriage-return and then printing
+ * the content of the line until we reach the correct cursor position.
+ *
+ * There is some additional fine detail here.
+ *
+ * Firstly, even though kdb_printf() will correctly format zero-width fields
+ * we want the second call to kdb_printf() to be conditional. That keeps things
+ * a little cleaner when LOGGING=1.
+ *
+ * Secondly, we can't combine everything into one call to kdb_printf() since
+ * that renders into a fixed length buffer and the combined print could result
+ * in unwanted truncation.
+ */
+static void kdb_position_cursor(char *prompt, char *buffer, char *cp)
+{
+	kdb_printf("\r%s", kdb_prompt_str);
+	if (cp > buffer)
+		kdb_printf("%.*s", (int)(cp - buffer), buffer);
+}
+
 /*
  * kdb_read
  *
@@ -212,7 +239,6 @@ static char *kdb_read(char *buffer, size_t bufsize)
 						 * and null byte */
 	char *lastchar;
 	char *p_tmp;
-	char tmp;
 	static char tmpbuffer[CMD_BUFLEN];
 	int len = strlen(buffer);
 	int len_tmp;
@@ -249,12 +275,8 @@ static char *kdb_read(char *buffer, size_t bufsize)
 			}
 			*(--lastchar) = '\0';
 			--cp;
-			kdb_printf("\b%s \r", cp);
-			tmp = *cp;
-			*cp = '\0';
-			kdb_printf(kdb_prompt_str);
-			kdb_printf("%s", buffer);
-			*cp = tmp;
+			kdb_printf("\b%s ", cp);
+			kdb_position_cursor(kdb_prompt_str, buffer, cp);
 		}
 		break;
 	case 10: /* linefeed */
@@ -272,19 +294,14 @@ static char *kdb_read(char *buffer, size_t bufsize)
 			memcpy(tmpbuffer, cp+1, lastchar - cp - 1);
 			memcpy(cp, tmpbuffer, lastchar - cp - 1);
 			*(--lastchar) = '\0';
-			kdb_printf("%s \r", cp);
-			tmp = *cp;
-			*cp = '\0';
-			kdb_printf(kdb_prompt_str);
-			kdb_printf("%s", buffer);
-			*cp = tmp;
+			kdb_printf("%s ", cp);
+			kdb_position_cursor(kdb_prompt_str, buffer, cp);
 		}
 		break;
 	case 1: /* Home */
 		if (cp > buffer) {
-			kdb_printf("\r");
-			kdb_printf(kdb_prompt_str);
 			cp = buffer;
+			kdb_position_cursor(kdb_prompt_str, buffer, cp);
 		}
 		break;
 	case 5: /* End */
@@ -390,13 +407,9 @@ static char *kdb_read(char *buffer, size_t bufsize)
 				memcpy(cp+1, tmpbuffer, lastchar - cp);
 				*++lastchar = '\0';
 				*cp = key;
-				kdb_printf("%s\r", cp);
+				kdb_printf("%s", cp);
 				++cp;
-				tmp = *cp;
-				*cp = '\0';
-				kdb_printf(kdb_prompt_str);
-				kdb_printf("%s", buffer);
-				*cp = tmp;
+				kdb_position_cursor(kdb_prompt_str, buffer, cp);
 			} else {
 				*++lastchar = '\0';
 				*cp++ = key;

-- 
2.43.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
