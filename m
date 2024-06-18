Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A4290C0EE
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 18 Jun 2024 03:05:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sJNIG-00028A-Oe
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 18 Jun 2024 01:05:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dianders@chromium.org>) id 1sJNIE-000283-RX
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 01:05:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fWRveTj7gNOiUWOxLfGonpPzYeI6GUmJM4srwsOzQy8=; b=VbuHQK4ib0V5Z7oZ/yn5rXN5sb
 hmtGY37/NR4TnqAapLQRJYunl8sFEVzmoBGSPWKRBmiejRGzzi2qU4EKxj1/rtyrv/IUKXrnmU6R5
 kcd8unLOqW+FeUwdrlfuz4DctTVYInCC5l/tZUCxdqjGpiltWG8C95uhYTFgv362zfS4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fWRveTj7gNOiUWOxLfGonpPzYeI6GUmJM4srwsOzQy8=; b=cLSaoJD4NRft7sA07hw9yRRsiK
 gztNxm0vTjXt4otrTFBkdAl1vX0sWZbCL8c7KUycClfRO9prUCn9GXhKtbbbLkmbMs+iUrABPGvIS
 1L6nyS8r89+vLx3BsM8R9ut2uRK2ttMceIB1f9J14v/yV8KNm7QnyuWy/Iwu6jMmERo0=;
Received: from mail-il1-f179.google.com ([209.85.166.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sJNIF-0006Ch-3p for kgdb-bugreport@lists.sourceforge.net;
 Tue, 18 Jun 2024 01:05:50 +0000
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-3758fa1cc8eso18927105ab.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 17 Jun 2024 18:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1718672744; x=1719277544;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fWRveTj7gNOiUWOxLfGonpPzYeI6GUmJM4srwsOzQy8=;
 b=iO0GNgqCnJS6+k9s9xGXpx+2tyuFYG+1D22Lrp9JtprTpYuDjaJdtJK3kBN+8jZO25
 KomrPc5Qx4gWdPUFRtqelUhxk7Z/B/LbrBKBQPJ6mY7/9pQCRqXEteY0B4IBCYjbX8ym
 NYp/Hl5vFMo53OTdCMCf4XkbURIGS6XgI7nvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718672744; x=1719277544;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fWRveTj7gNOiUWOxLfGonpPzYeI6GUmJM4srwsOzQy8=;
 b=OkM0GWxsi8kFVemj+hG+4HYVvetJ2eP4Dt3m3LoY8yo8C/tCyZrFsj3esGEfpiczxu
 WlW45m/TwA8/MZys5bqYoVWs+DWH6kz8FxRGq9hvmJrp6ce3NRfKw7aNJlGMYBUbfcdy
 IhGvRck3oH8tw1hVryPWbgSXIEHX0qtD+XGMvol6717YP6/dg5NLZwASi3sJNnaQgSAL
 dohCLWdvl9y8QzDiETHYPbwkHdnRqgl3YSLRJr+X23sloyeEvERcgW0YBfaBDQEhk8ko
 a4wQGdUj9jsQMgHXLpT1hPGAzZhyU2Hd7gg3TqU+NKkkdtWEkii4BG/VgkBd8598/NOw
 hGfA==
X-Gm-Message-State: AOJu0YwCHaIKJQfuSZgFjpKh8VVqGf8uCMPiqhZAMKxq6QaKdgg/AD3N
 k3VH/J7l+794LuWtgaqSNpJVJvv9QlAV3OdsSdXppzbg3QOdm2/7QKELZyeE6ih5dMETQKW0A4w
 =
X-Google-Smtp-Source: AGHT+IGI3mseEIj5mmCReMXbnQOFETM6xmfqcgkzTut3mANpur+xZ3fiAWl2XLNVez9BwZAzKsdtAw==
X-Received: by 2002:a05:6a20:a123:b0:1af:cfca:e515 with SMTP id
 adf61e73a8af0-1bae7d8538dmr15672555637.12.1718670984976; 
 Mon, 17 Jun 2024 17:36:24 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:1798:e71b:11ad:8b94])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705ccb99f4dsm7905917b3a.216.2024.06.17.17.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 17:36:23 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Date: Mon, 17 Jun 2024 17:34:43 -0700
Message-ID: <20240617173426.9.I95a99321878631c9ed6a520feba65b949f948529@changeid>
X-Mailer: git-send-email 2.45.2.627.g7a2c4fd464-goog
In-Reply-To: <20240618003546.4144638-1-dianders@chromium.org>
References: <20240618003546.4144638-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Several of the integers in kdb_md() should be marked
 unsigned.
 Mark them as such. When doing this, we need to add an explicit cast to the
 address masking or it ends up getting truncated down to "int" [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.179 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.179 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.179 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.179 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sJNIF-0006Ch-3p
Subject: [Kgdb-bugreport] [PATCH 09/13] kdb: Use 'unsigned int' in kdb_md()
 where appropriate
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
 Thorsten Blum <thorsten.blum@toblux.com>, linux-kernel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 Jason Wessel <jason.wessel@windriver.com>,
 Yuran Pereira <yuran.pereira@hotmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Several of the integers in kdb_md() should be marked unsigned. Mark
them as such. When doing this, we need to add an explicit cast to the
address masking or it ends up getting truncated down to "int" size.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 kernel/debug/kdb/kdb_main.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index fcd5292351a7..c064ff093670 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -1594,8 +1594,8 @@ static void kdb_md_line(const char *fmtstr, unsigned long addr,
 static int kdb_md(int argc, const char **argv)
 {
 	static unsigned long last_addr;
-	static int last_radix, last_bytesperword, last_repeat;
-	int radix = 16, mdcount = 8, bytesperword = KDB_WORD_SIZE, repeat = 0;
+	static unsigned int last_radix, last_bytesperword, last_repeat;
+	unsigned int radix = 16, mdcount = 8, bytesperword = KDB_WORD_SIZE, repeat = 0;
 	char fmtchar, fmtstr[64];
 	unsigned long addr;
 	unsigned long word;
@@ -1722,11 +1722,11 @@ static int kdb_md(int argc, const char **argv)
 
 	/* Round address down modulo BYTESPERWORD */
 
-	addr &= ~(bytesperword-1);
+	addr &= ~((unsigned long)bytesperword - 1);
 
 	while (repeat > 0) {
 		unsigned long a;
-		int n, z, num = (symbolic ? 1 : (16 / bytesperword));
+		unsigned int n, z, num = (symbolic ? 1 : (16 / bytesperword));
 
 		if (KDB_FLAG(CMD_INTERRUPT))
 			return 0;
@@ -1745,7 +1745,7 @@ static int kdb_md(int argc, const char **argv)
 		repeat -= n;
 		z = (z + num - 1) / num;
 		if (z > 2) {
-			int s = num * (z-2);
+			unsigned int s = num * (z-2);
 			kdb_printf(kdb_machreg_fmt0 "-" kdb_machreg_fmt0
 				   " zero suppressed\n",
 				addr, addr + bytesperword * s - 1);
-- 
2.45.2.627.g7a2c4fd464-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
