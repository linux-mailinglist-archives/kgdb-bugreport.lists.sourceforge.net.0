Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C10895105
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  2 Apr 2024 12:57:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1rrbpE-0002De-7B
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 02 Apr 2024 10:57:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <thorsten.blum@toblux.com>) id 1rpr8y-0004v0-1b
 for kgdb-bugreport@lists.sourceforge.net;
 Thu, 28 Mar 2024 14:54:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zFHFaYhbiJTu3wWh/FUqbgyhTcKenad53U5xQx+ENpg=; b=kmcGKM0ifk2JUeSS7/F5OiR0Vm
 ogc7qO2LSD8nEg6RpTLGet0yQoNKmGZT0CUzJ93glm5Y7HduNkz+HeCRe2HZ/Jx8piYdkU6DrDVzt
 CIpexveLXv2CGhQAh1VmzlwiM2DOaOSUguSRlVhaaGz66+b0fPjpFfKjgex2Hm1PU6Sw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zFHFaYhbiJTu3wWh/FUqbgyhTcKenad53U5xQx+ENpg=; b=B
 pkPhGk4zQJkM/qHkL6QFKnCFDLHiJjw4gu+N9w8ckkuesBJbzK0x62mpWqB66qmFf5SQdfovbPoQ9
 0acHe15kCmYMETtKxpt04NLECmDbYaPQLyk7TMuf2k8n0U6dq7MKGZBeNIgjzvVyN018KuOJBMBfq
 +WMwl2FT7wuJYH8E=;
Received: from mail-wm1-f42.google.com ([209.85.128.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rpr8w-0000wO-7v for kgdb-bugreport@lists.sourceforge.net;
 Thu, 28 Mar 2024 14:54:15 +0000
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-41494c040a1so7178395e9.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Thu, 28 Mar 2024 07:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=toblux-com.20230601.gappssmtp.com; s=20230601; t=1711637643; x=1712242443;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zFHFaYhbiJTu3wWh/FUqbgyhTcKenad53U5xQx+ENpg=;
 b=VJ/Lpzn23PDYBBs9Mkyt0UKerlzsbsAdasrRf8pmgijW521crs5AHXkrP0gDiVTKyU
 7YKsSALi6yZGO1n7hw0swUputN2K2bhvEGphZvpeQxjrdkcjbOOFXEqL5RQTd8dSAGf1
 Xr7GSgOmn0Wa5AS3968JKjAWV+amva/qrowb2+b29VLqpaFnPYR5wFH7Be8UZertxWtv
 G1pUKRvmoL9Tyv5xksmGni1mmde/PFRstadX8xDg/5m4Y06Af/D5T0IWn8h7yipIvcvb
 LfDwnXzXEIdieABlrtVjjFRxUOhWOkdETldRqJXf8UCWbYgxKSU3roOtz1tWsaBoFuUo
 B+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711637643; x=1712242443;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zFHFaYhbiJTu3wWh/FUqbgyhTcKenad53U5xQx+ENpg=;
 b=WQQHucu0/nPHzd05FBvnz6hxfvbj/7iBPiZtjQmCWDrihJzyqgIA6slfYgrTcVcDSV
 Q4luWzFVi/JIK/PuQmmimv3PsPSN/Eu6H8sdHcwtAYcNzWf63gIkbnXeTtQ/2BVrkpmu
 c9zH1lhjxs0wIJEjEQFGYiLRh6xJq2CU2Nzit8FRJhr9LpsaGd6l9tJVLGQVPq6qh5yw
 79ahOyAN224iupOyugXgMqJurNubbiGK+RXVyn3Ci36fYXamUl0kz84bgSDerHqKpMBh
 QS1CQQIOS0HtZ+dWyQEsK6VfiUG7ScdadMDTr4cORWb4uCb6Qkq8EOVVh4JC57Ywn0q6
 jxZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+QxPJEZS0EeA7fNQ8XoB3/8Z1wP9i4qHFcCvsf1e2vBNftqagbkk3wvCtVBLxgqAWNHlpws5CbvgAUPiW0sRVKG1BDWJIoPeXwxa8e4hyQHk1rpQ=
X-Gm-Message-State: AOJu0Yzbr670DiTotnAWq54i8ZPlKeuKNySu0YdqcrSbxDtlpS9oOMh1
 iSvSlizvqq53lcIAiH2aHwSCYxQ+kwirNdPALkVkoT+l0E3gJJGmVrKABAcG5FJ4wQdVhtMgdvu
 r3Sk=
X-Google-Smtp-Source: AGHT+IEVn1KFNj41KXdJYnbXbudHvcOeDBZ/l1OTIy/d6Jkixdhi4F28n2jwIlz35Eq+/ZH+oHbZKw==
X-Received: by 2002:a17:906:4956:b0:a4e:24cf:76d3 with SMTP id
 f22-20020a170906495600b00a4e24cf76d3mr1345642ejt.50.1711634594192; 
 Thu, 28 Mar 2024 07:03:14 -0700 (PDT)
Received: from fedora.fritz.box (aftr-82-135-80-212.dynamic.mnet-online.de.
 [82.135.80.212]) by smtp.gmail.com with ESMTPSA id
 u23-20020a170906125700b00a47522c193asm783904eja.196.2024.03.28.07.03.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Mar 2024 07:03:13 -0700 (PDT)
From: Thorsten Blum <thorsten.blum@toblux.com>
To: Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Douglas Anderson <dianders@chromium.org>
Date: Thu, 28 Mar 2024 15:00:17 +0100
Message-ID: <20240328140015.388654-3-thorsten.blum@toblux.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Fixes the following Coccinelle/coccicheck warning reported
 by string_choices.cocci: opportunity for str_plural(days) Signed-off-by:
 Thorsten Blum <thorsten.blum@toblux.com> --- kernel/debug/kdb/kdb_main.c |
 2 +- 1 file changed, 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.42 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.42 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1rpr8w-0000wO-7v
X-Mailman-Approved-At: Tue, 02 Apr 2024 10:57:06 +0000
Subject: [Kgdb-bugreport] [PATCH] kdb: Use str_plural() to fix Coccinelle
 warning
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
 Yuran Pereira <yuran.pereira@hotmail.com>,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-kernel@vger.kernel.org, Thorsten Blum <thorsten.blum@toblux.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Fixes the following Coccinelle/coccicheck warning reported by
string_choices.cocci:

	opportunity for str_plural(days)

Signed-off-by: Thorsten Blum <thorsten.blum@toblux.com>
---
 kernel/debug/kdb/kdb_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index d05066cb40b2..664bae55f2c9 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -2517,7 +2517,7 @@ static int kdb_summary(int argc, const char **argv)
 	if (val.uptime > (24*60*60)) {
 		int days = val.uptime / (24*60*60);
 		val.uptime %= (24*60*60);
-		kdb_printf("%d day%s ", days, days == 1 ? "" : "s");
+		kdb_printf("%d day%s ", days, str_plural(days));
 	}
 	kdb_printf("%02ld:%02ld\n", val.uptime/(60*60), (val.uptime/60)%60);
 
-- 
2.44.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
