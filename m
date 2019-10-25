Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E02CDE4487
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 25 Oct 2019 09:33:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iNu6b-0004Tf-Os
	for lists+kgdb-bugreport@lfdr.de; Fri, 25 Oct 2019 07:33:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1iNu6a-0004TY-AN
 for kgdb-bugreport@lists.sourceforge.net; Fri, 25 Oct 2019 07:33:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N2ThTAgeoHW31mlsGh12ha2Pd6KE6BHGLEXeQ2AbFfI=; b=kE+TQNLPJwMOkW+A4vN9Kg7DKN
 Naid6+T4xO9znBglMCe22KLKGrOAdH+phpyOUBUcVDLp05OvSLQwxSMvKtjSlL3fo/nlNky1KLu3W
 adbilbIwWbzSMAiiQOnrBFKvBfKU2W/cgErrGsLqirtKPT1R5TWbO7feeIPZxkUgyF/Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N2ThTAgeoHW31mlsGh12ha2Pd6KE6BHGLEXeQ2AbFfI=; b=DChVgqUnvxKITmEcImLEkWoaaF
 Q3cDZHwlQECrxnKXrhu+DPYOCQJe6KE6XgcA5+PMcsiEkrS9Kgg0ubtm/NQ2fa/o7xygN96zh96fr
 ZE0Vd1h+jLWe5VbhBAYQ0KIFD7gZnWjqVzJvbPH9d7mMZtsUdfB0RTGYPdR1e7tRA0to=;
Received: from mail-wm1-f65.google.com ([209.85.128.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iNu6Z-00GRxy-4G
 for kgdb-bugreport@lists.sourceforge.net; Fri, 25 Oct 2019 07:33:52 +0000
Received: by mail-wm1-f65.google.com with SMTP id c22so915036wmd.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 25 Oct 2019 00:33:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=N2ThTAgeoHW31mlsGh12ha2Pd6KE6BHGLEXeQ2AbFfI=;
 b=Cvs9FoyYv3MIFrp8WsjkZyLWI7/e8F24s3eJ99R0F1t4im2+jVXGtFQuSpT7wg3scc
 wsdBc7PXrlNxj22obCjBZy14slZaCxrfheFn1+wmC8Xy1rZaOWc1eQ60VjEYGPp6b/xo
 iIkWjEJYecuOfoEUGTAsoCrjvgxigmHbtwl2qh4UB2czJI2aNxSxmZ+EedpO2rYEueBe
 mZWcnRQGeptOqWd2+S6GA59sILp53CTh9fm3jOrMTtjcObFTulfmEGsOM9IQDxcAoRzl
 j7AIrrWMZL7YrxHf+6bFe9NhFOXQ1RWVWS58lPGPx5ABi9/7dLBYS8ib4dqZ2AQvMOmR
 d80g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N2ThTAgeoHW31mlsGh12ha2Pd6KE6BHGLEXeQ2AbFfI=;
 b=d06yKsvLFcInqeir51nn//RUhtjeUlzwYp6f3+dId24uWGFdJVdiODsEH87R6gRk9t
 qafTRnB0eh3vboG940u+xhO8ojv5qrEEcG6LD0+OnLaQXWlJzE58J2K18RkrQxrI6dBA
 iUVUYFoJqRPRKDc/UWykHNLnU/IPoOyZ+t/lqJQxyRrPHDxWeDzCUg0rg/JTn3a1JCmS
 aW9Dm7re+egVrAwY2Gm+72iFqtmsS9Ri31E4ReoIH7qxf9CjNkk6vs9Fvo7XZjqbAVXg
 vkKGt4O/CV8auX73rzTpukSt+46M57kwHuHaaAARKM7Zoz72L2imtWa+6+m19H5o079k
 xGFw==
X-Gm-Message-State: APjAAAXj387X3G07jCLwO2+M2hcBmvadDaeYMfgtSLy4J/718wzrL8Uf
 XVyMP69fGnrZQHgNoiimeJdldg==
X-Google-Smtp-Source: APXvYqwyGKGRjS9F8gjBeH9bcpVse8C1AwyaGfdsUQNKHh5P4Ahfrc9NpXUS5b2AvwtLf8hZ5yKnQw==
X-Received: by 2002:a7b:cd89:: with SMTP id y9mr2191028wmj.51.1571988824531;
 Fri, 25 Oct 2019 00:33:44 -0700 (PDT)
Received: from wychelm.lan
 (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id a11sm1586602wmh.40.2019.10.25.00.33.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Oct 2019 00:33:43 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>,
 Jason Wessel <jason.wessel@windriver.com>
Date: Fri, 25 Oct 2019 08:33:25 +0100
Message-Id: <20191025073328.643-3-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191025073328.643-1-daniel.thompson@linaro.org>
References: <20191025073328.643-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.65 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iNu6Z-00GRxy-4G
Subject: [Kgdb-bugreport] [PATCH v4 2/5] kdb: Simplify code to fetch
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
index cfc054fd8097..a92ceca29637 100644
--- a/kernel/debug/kdb/kdb_io.c
+++ b/kernel/debug/kdb/kdb_io.c
@@ -124,25 +124,18 @@ static int kdb_read_get_key(char *buffer, size_t bufsize)
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
@@ -150,27 +143,24 @@ static int kdb_read_get_key(char *buffer, size_t bufsize)
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
 			key = kdb_handle_escape(escape_data, ped - escape_data);
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
