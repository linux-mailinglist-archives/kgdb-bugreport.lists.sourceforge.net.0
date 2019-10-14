Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 40A49D666B
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 14 Oct 2019 17:46:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iK2Yc-0007UI-1g
	for lists+kgdb-bugreport@lfdr.de; Mon, 14 Oct 2019 15:46:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1iK2YV-0007U0-9y
 for kgdb-bugreport@lists.sourceforge.net; Mon, 14 Oct 2019 15:46:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7kINXNWWBt4SCXZfRMWNijcHokD4yWzFteamr/of+Do=; b=i1bZ1+2fc1AWYWROYOvjgAU7eu
 oCfQf+caNNBoUn7gEQzMNNcz5M2k6oQCrfJiW28uZ+vELDub9d2r09BBQxwxrBnPZtbs8yMaP3+ig
 NBUwIdjH8CaoLlg/d12SbfEfvT9gWBlIjUUbSiaQSu9eYLcfieVzYCdODJi2YWUzV4dc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7kINXNWWBt4SCXZfRMWNijcHokD4yWzFteamr/of+Do=; b=BETwYn+df7E+ixmJ7BRIymDXpu
 PilENhf5dJ4DoHGkwkXcmrtL9WbmXDXzlbjyIejvQTuZURpi21C6CedNbCSTFJXua0L6xtqkNYtmy
 6NQcifKK3PTdfaShXXNaGjMN8NsExXAAfHRVCxtNBRsVGQeLnzwmc95WJwD6xjk8uxWU=;
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iK2YR-008uFF-7t
 for kgdb-bugreport@lists.sourceforge.net; Mon, 14 Oct 2019 15:46:43 +0000
Received: by mail-wr1-f68.google.com with SMTP id n14so20270735wrw.9
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 14 Oct 2019 08:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7kINXNWWBt4SCXZfRMWNijcHokD4yWzFteamr/of+Do=;
 b=wDcXON+1m4xAvti7aNKoc4cwF+oGVBwBFrv+CuaZGoSXIxoadjTCogRb+8Gi3on6Ph
 X63WBulioLHClOM0wy48u5QXBnY3CrsffaJ2GHcPloBlVAj++z0zpW/CDqgyaHy5fWTP
 Pwpdx1VDGTtMbhaW1dOfkNWCcevpdo4dOOOzoIHkYWHV1zahTUyITHbfcmukOpiGFMlO
 IFRLoBaAzPD07oiavJbvoyFk5kL4bPekWz+AATsk+e/gpmdjWIk/IV5vEINYtMuCVGhC
 NnEdyHXGWrKNpAucuRa884MReYJfDNCM0GK1o+cHtotwrwIeG9gwhmmf3adlrbyyvx0n
 4Sxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7kINXNWWBt4SCXZfRMWNijcHokD4yWzFteamr/of+Do=;
 b=udFEMSyOods/wxpXFGo3jiJP89qil+CbLSmn1OwbgWYLudB2HCx74FlhQc/XXcndfG
 JsOXSy9bJs7uWAvjoxw8BbLfMt7TZYrFStOSamqxnEh1eGIHSpNAmemUvrxFBvmsl02K
 zBIPZuL/qux7rzL69RtaXhnmK7bOfRMHuJ14YAQEvVcNjt83O/Ji5rWqUcAX/rdEza7y
 rsoXgvhnzjmWuFGXvrpXmLe1EjuOoDSnoaM0dMrCdEs/ZG8jXwgJsyLiTY1khmitZQ2i
 Lhp6OhmuW8EPzJQ6A7C4JfM6o3AFA4Dzu14wxtb34DvKgiSjKBVe+3a6Pfotp8jzkqT1
 ltjA==
X-Gm-Message-State: APjAAAWBxEmucHdqgMhTypGMC7sYLEqpE+9wZ/Rdrt3IO0yXpHsASIbu
 Q73K9ECr36NYFezMmRWx1Hd0mA==
X-Google-Smtp-Source: APXvYqy0ovnoys29DS6SHPRM492SOwp8R433s33wX1W4a85GrfH/w2L+Td6L/d9LtZee3kn3EjlN3w==
X-Received: by 2002:a5d:4f8b:: with SMTP id d11mr10159794wru.25.1571067992613; 
 Mon, 14 Oct 2019 08:46:32 -0700 (PDT)
Received: from wychelm.lan
 (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id q22sm16539738wmj.5.2019.10.14.08.46.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Oct 2019 08:46:31 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Douglas Anderson <dianders@chromium.org>
Date: Mon, 14 Oct 2019 16:46:23 +0100
Message-Id: <20191014154626.351-3-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191014154626.351-1-daniel.thompson@linaro.org>
References: <20191014154626.351-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iK2YR-008uFF-7t
Subject: [Kgdb-bugreport] [PATCH v3 2/5] kdb: Simplify code to fetch
 characters from console
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
 patches@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Currently kdb_read_get_key() contains complex control flow that, on
close inspection, turns out to be unnecessary. In particular:

1. It is impossible to enter the branch conditioned on (escape_delay == 1)
   except when the loop enters with (escape_delay == 2) allowing us to
   combine the branches.

2. Most of the code conditioned on (escape_delay == 2) simply modifies
   local data and then breaks out of the loop causing the function to
   return escape_data[0].

3. Based on #2 there is not actually any need to ever explicitly set
   escape_delay to 2 because we it is much simpler to directly return
   escape_data[0] instead.

4. escape_data[0] is, for all but one exit path, known to be '\e'.

Simplify the code based on these observations.

There is a subtle (and harmless) change of behaviour resulting from this
simplification: instead of letting the escape timeout after ~1998
milliseconds we now timeout after ~2000 milliseconds

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 kernel/debug/kdb/kdb_io.c | 38 ++++++++++++++------------------------
 1 file changed, 14 insertions(+), 24 deletions(-)

diff --git a/kernel/debug/kdb/kdb_io.c b/kernel/debug/kdb/kdb_io.c
index 68e2c29f14f5..78cb6e339408 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -122,25 +122,18 @@ static int kdb_read_get_key(char *buffer, size_t bufsize)
 			touch_nmi_watchdog();
 			f = &kdb_poll_funcs[0];
 		}
-		if (escape_delay == 2) {
-			*ped = '\0';
-			ped = escape_data;
-			--escape_delay;
-		}
-		if (escape_delay == 1) {
-			key = *ped++;
-			if (!*ped)
-				--escape_delay;
-			break;
-		}
+
 		key = (*f)();
+
 		if (key == -1) {
 			if (escape_delay) {
 				udelay(ESCAPE_UDELAY);
-				--escape_delay;
+				if (--escape_delay == 0)
+					return '\e';
 			}
 			continue;
 		}
+
 		if (bufsize <= 2) {
 			if (key == '\r')
 				key = '\n';
@@ -148,28 +141,25 @@ static int kdb_read_get_key(char *buffer, size_t bufsize)
 			*buffer = '\0';
 			return -1;
 		}
+
 		if (escape_delay == 0 && key == '\e') {
 			escape_delay = ESCAPE_DELAY;
 			ped = escape_data;
 			f_escape = f;
 		}
 		if (escape_delay) {
-			*ped++ = key;
-			if (f_escape != f) {
-				escape_delay = 2;
-				continue;
-			}
+			if (f_escape != f)
+				return '\e';
 
+			*ped++ = key;
 			key = kdb_read_handle_escape(escape_data,
 						     ped - escape_data);
-			if (key > 0) {
-				escape_data[0] = key;
-				escape_data[1] = '\0';
-			}
-			if (key)
-				escape_delay = 2;
-			continue;
+			if (key < 0)
+				return '\e';
+			if (key == 0)
+				continue;
 		}
+
 		break;	/* A key to process */
 	}
 	return key;
-- 
2.21.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
