Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C67618A68E4
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 16 Apr 2024 12:45:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rwgJo-0000lF-9v
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 16 Apr 2024 10:45:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1rwgJm-0000l5-42
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 16 Apr 2024 10:45:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Qw8fuXLn1BipxTXGJjzIm9TXoIt9ndz+hzAX+iGey14=; b=coRMPReiSfQg77Rbd62H+q1Mhg
 hb9WvW6D2z6XwSe0YYySdyQ43PF8xbPU0joF3nNWcpwnI2G7ZrGN+cj2X1QWGl2XIHGKydaXXUPkV
 rC0pAM51vo4wH2QYXl0Gz3qNp+fRbFfK2gOI54iaPLhMavJMo907FHkTFrRsWgzUJDjg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Qw8fuXLn1BipxTXGJjzIm9TXoIt9ndz+hzAX+iGey14=; b=hp7KNVsy3BefzAdZlEzVNIuoTJ
 LwiWh23dlTJimp/wfGLGK3BUkKuBVejVOs1QzGG+s8GzTLsdCYE9fGmxrEwTWXBE/ApTZf0jUQvHJ
 CVWhtEpGWeUJ/ws/FXZTAZ4e2JgIMiVwlmKQAv5kdEq8kjp4PEEdMoWQ0nAFYJ7438Ic=;
Received: from mail-wm1-f52.google.com ([209.85.128.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rwgJl-0003aJ-AP for kgdb-bugreport@lists.sourceforge.net;
 Tue, 16 Apr 2024 10:45:38 +0000
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-41879819915so10510485e9.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 16 Apr 2024 03:45:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713264326; x=1713869126; darn=lists.sourceforge.net;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Qw8fuXLn1BipxTXGJjzIm9TXoIt9ndz+hzAX+iGey14=;
 b=PzXPhwgKdUapfJ03h6jTiGi6lBQre6KDX9royTyNB264dNc3gBPXQFoyoubQYwuq4C
 UUm3h0PFwAVkFyV9017GU0d6v0eyqkMRJXay405fQctpG0NCqXr1+FmQB/WQBd/21n6Q
 lQphtOnYsCEcv5HZ7TXRvMAn/hJKgNXEfVIJfr/DF4miSE9PLATCpiDV8Ma6R8phVtva
 LxWclNgpxULaeGiLeS/m7r16IcqhboLeB8YA34FD3EGp/USHXvLifhG5Qr4WBXUWxhEP
 nc9Q8+4o1puDy7USqmItal+HzWq8QG5Gn8a7gVWX+SpZRZbANYVUisRycNpNPEyJdjeZ
 v7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713264326; x=1713869126;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qw8fuXLn1BipxTXGJjzIm9TXoIt9ndz+hzAX+iGey14=;
 b=VS0L60b06Zm79lPW3CGZ+1hSTuwu0Hr+GcRWjJookXGiHdsgJ6RGxhgDF1nO5+CUen
 VM/T1fQC0uZK7LwFv6kY081Kzw3YzcguM+YND+GUbSrB7JKvLKbCk6rh1qFaZ54HBf1e
 r//rcZKG2Psm5UhjK34Yn3ofUNcWAZBupwBgdVuleqe/4VLFObwSxUBe+MeMV6B6gOSC
 PiVlk3mG218ZEowW+uJp5fRpmW+354/LpTAyUr/4lOUQhX9D9Mc9V+ndnCxkn3yocEEM
 1tiw+bi5lLymmd4TPI4atcgz6dPHkaChF28rP6DT/rBybT4everYdqTmCgTS9LctcaV4
 8Qjg==
X-Gm-Message-State: AOJu0Yw+PvMgEaUjBFqpKAlGB1OUCWwu7MoZiyA1hKMtl6eIGqNKxmFD
 ECUZ0mIFSROL4CX+XIvGRu089B70Eg07hDhxOS4htHX9jJKgPhwDbro49yA4L4k=
X-Google-Smtp-Source: AGHT+IEkKrGI1w3FZWu0NvjNbI56P0aC7fTieG2Y5zpD0wRzVFCxdwIhDQBiZNI+lF1oAhflsZo0ww==
X-Received: by 2002:adf:f2c4:0:b0:347:f94b:94df with SMTP id
 d4-20020adff2c4000000b00347f94b94dfmr3255688wrp.2.1713264325736; 
 Tue, 16 Apr 2024 03:45:25 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 o9-20020a5d6709000000b00343956e8852sm14470141wru.42.2024.04.16.03.45.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 03:45:24 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
Date: Tue, 16 Apr 2024 11:43:20 +0100
MIME-Version: 1.0
Message-Id: <20240416-kgdb_read_refactor-v1-3-b18c2d01076d@linaro.org>
References: <20240416-kgdb_read_refactor-v1-0-b18c2d01076d@linaro.org>
In-Reply-To: <20240416-kgdb_read_refactor-v1-0-b18c2d01076d@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>, 
 Douglas Anderson <dianders@chromium.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1753;
 i=daniel.thompson@linaro.org; h=from:subject:message-id;
 bh=jn1ryZV2lseU9K0OYgA4GJIVFoBB6E4nLhtvlmWlSd4=;
 b=owEBbQKS/ZANAwAKAXzjJV0594ihAcsmYgBmHlZ5c/sK6PaiUl1WqzpDtZN3BjukmuYcg+TaJ
 oiDr1GCb5eJAjMEAAEKAB0WIQQvNUFTUPeVarpwrPB84yVdOfeIoQUCZh5WeQAKCRB84yVdOfeI
 ofLXD/4xVew6HZYrS28jTX94YhhCHkyLF7uKVGu51j294zh/mIX+9HFyPjgAu7r3BMfPNqUdB3g
 4L9SlWdDtGyZYatWEqIgsmy/ngHQiyeAu2CiMD6UEzwLy/z2/Lsyo8JpognhjaTlnaHOTlflrLa
 PRlOhMg6hTTAIkovLaomVCODDTKPMNiQfKWJhsjnl/D+Cfg3tBrxioPuh9xBoBjTmgjbgOUYRnB
 0Dy0neA0kX8KLfsf2NvQIh0HEn+QEl/0GIO/O+YeeQVyD4P2UdapOF1OB+k/E22gq7ySBnUAz//
 sr1Yb4mOz761ymuPwvB3o8we9r8Mq1lr7OQCWi/F48pqlmARRX30EIjLNiIieP348OMWNYlpifM
 TgpHy78luYFBHup8CC8JN1wx37FV4pgMEdU2woUw/skDslMjzjpqEmlVgq0LD5N5BvpOkj5C9uN
 +NyKzsY+bN1x0g2NxtRZeMceSgnkdIB3s5AsFqNE2xsuOL7T6jia3YMfaN2RI4DN4yVUsMI3W2y
 hSKFRaCshA5yxURhziSS7ECutPW76a5Ib3QVYi7NWtHRv/YoRtQH9jAhr7Cpnwuz+nuFhXzzd6l
 v060LY7GCrjrLNtGl8OJX7u/8FC6+z7o8XdirHHuOA6LLGQVGCe8WkwJPkmS+rNRYrAgJd2fPMH
 LErhTOsrlxZ8z0A==
X-Developer-Key: i=daniel.thompson@linaro.org; a=openpgp;
 fpr=E38BE19861669213F6E2661AA8A4E3BC5B7B28BE
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Currently, if the cursor position is not at the end of the
 command buffer and the user uses the Tab-complete functions, then the console
 does not leave the cursor in the correct position. For example consider the
 following buffer with the cursor positioned at the ^: 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.52 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1rwgJl-0003aJ-AP
Subject: [Kgdb-bugreport] [PATCH 3/7] kdb: Fix console handling when editing
 and tab-completing commands
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
Cc: kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Currently, if the cursor position is not at the end of the command buffer
and the user uses the Tab-complete functions, then the console does not
leave the cursor in the correct position.

For example consider the following buffer with the cursor positioned
at the ^:

md kdb_pro 10
          ^

Pressing tab should result in:

md kdb_prompt_str 10
                 ^

However this does not happen. Instead the cursor is placed at the end
(after then 10) and further cursor movement redraws incorrectly. The
same problem exists when we double-Tab but in a different part of the
code.

Fix this by sending a carriage return and then redisplaying the text to
the left of the cursor.

Cc: stable@vger.kernel.org
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 kernel/debug/kdb/kdb_io.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index a42607e4d1aba..69549fe42e87b 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -364,6 +364,8 @@ static char *kdb_read(char *buffer, size_t bufsize)
 			kdb_printf("\n");
 			kdb_printf(kdb_prompt_str);
 			kdb_printf("%s", buffer);
+			if (cp != lastchar)
+				kdb_position_cursor(kdb_prompt_str, buffer, cp);
 		} else if (tab != 2 && count > 0) {
 			/* How many new characters do we want from tmpbuffer? */
 			len_tmp = strlen(p_tmp) - len;
@@ -377,6 +379,9 @@ static char *kdb_read(char *buffer, size_t bufsize)
 				kdb_printf("%s", cp);
 				cp += len_tmp;
 				lastchar += len_tmp;
+				if (cp != lastchar)
+					kdb_position_cursor(kdb_prompt_str,
+							    buffer, cp);
 			}
 		}
 		kdb_nextline = 1; /* reset output line number */

-- 
2.43.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
