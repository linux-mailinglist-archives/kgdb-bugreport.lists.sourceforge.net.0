Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC7ABE601
	for <lists+kgdb-bugreport@lfdr.de>; Wed, 25 Sep 2019 22:03:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iDDV8-0003uL-1I
	for lists+kgdb-bugreport@lfdr.de; Wed, 25 Sep 2019 20:03:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1iDDV6-0003u5-Bs
 for kgdb-bugreport@lists.sourceforge.net; Wed, 25 Sep 2019 20:03:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YAwKOfkBAIB9WhQiaaLLy2L479R9P65WNB5nP2TJodw=; b=BJbATpHTbYTooXfq3rNYTwyDxq
 qfHDrvbkdGFv7zVuspPUr2pf0qk5WtjVi5OIYFGP2v/vcPRJLnuONs8eUlgXKKyx/khstHtMBop2a
 If7Kj1hrSbYCXL43+ID/DmeSfb0QW55CW9daJ7ZPtofG0nD/Ao4CFLZHqmr2qp4aH7kA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YAwKOfkBAIB9WhQiaaLLy2L479R9P65WNB5nP2TJodw=; b=Cb0y0TZJ6m3dEcNvlfeGdUDVlT
 J1C9tF/VJfi1AnkjgQxAI7nL7EOU2SxYmGwZJbBTKJLGBDt5hLWLdGgQaYSDYNK8/yZ3QZtgzNSu0
 clL7gbuPjsPTjcRvTIdBGRdqEGfzDMt/SiRYPCdwn1qdm3mMMDHcdbZu4IxA1Otuo3fY=;
Received: from mail-pf1-f193.google.com ([209.85.210.193])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iDDV2-006h5M-Ee
 for kgdb-bugreport@lists.sourceforge.net; Wed, 25 Sep 2019 20:03:00 +0000
Received: by mail-pf1-f193.google.com with SMTP id b128so70338pfa.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 25 Sep 2019 13:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YAwKOfkBAIB9WhQiaaLLy2L479R9P65WNB5nP2TJodw=;
 b=E7NBjARNhbdGyBXdEV8SyXfYFXQyEHoVKDUFATfGxCUW7CrsJ6l6NiTEHPv/xGeh0W
 BfaCeztNVfLgttNyC7QG1oPGJWoq+WBJLX1Yfnx/ZAwA0JU4ebpfWjQDrgQtfxGq10M0
 ovjSzK31JoYMMtGYyFANab+mXyrNWxh47wQig=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YAwKOfkBAIB9WhQiaaLLy2L479R9P65WNB5nP2TJodw=;
 b=rSjs/9FAPXM7H9oAaIlg+vDnOUzAkZQp6uNw7fExK68zw/udv+rMBPF25mLdBhGJ9R
 ZsEpEvPUCVPW0AJ7zOUxBtCryP5xPlptz9PWYLjN77m3V7eAL+Bhf/5AOZ6dzSJgRVYE
 dB7v+xx26DrkoS+3NTTTpiV1KXVehzgXdF8P+X/ITnhPSqZTsHrC8wlHgQiiN81adyuA
 49H276jZ9oeFTTh535L7YcGCyM0sYoiPFI+BCqJ/H7xv8/xvTiO0r4yPI3prA8cZ/BqS
 +U998IfvspMNwnj99ZE3G9RL/k31MxmDXPPMBQ7DAf98nJX2Jd4qtd9n14QfPHi5eDxA
 UGrw==
X-Gm-Message-State: APjAAAWxxNosl+A0fdK8SYWt6Nw6JtEZ8ojGdsU2S0aEvi1/I8xI1bi9
 2UaVJM66Rpy5fICITTgCD8cCTw==
X-Google-Smtp-Source: APXvYqwrbF0fnCNsefwBLmxVw3p+YzKu/TOroqO998JvI5nUXu99hXPkBBiV5cHhkxvVcrdR25vBvg==
X-Received: by 2002:a62:1888:: with SMTP id 130mr27979pfy.72.1569441770793;
 Wed, 25 Sep 2019 13:02:50 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id d76sm458113pga.80.2019.09.25.13.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Sep 2019 13:02:50 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>
Date: Wed, 25 Sep 2019 13:02:18 -0700
Message-Id: <20190925125811.v3.2.Ibc2d4ec1b0e23dbf39dcd296e3c56d8520fbc144@changeid>
X-Mailer: git-send-email 2.23.0.351.gc4317032e6-goog
In-Reply-To: <20190925200220.157670-1-dianders@chromium.org>
References: <20190925200220.157670-1-dianders@chromium.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.193 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1iDDV2-006h5M-Ee
Subject: [Kgdb-bugreport] [PATCH v3 2/4] kdb: Remove unused "argcount" param
 from kdb_bt1(); make btaprompt bool
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

The kdb_bt1() had a mysterious "argcount" parameter passed in (always
the number 5, by the way) and never used.  Presumably this is just old
cruft.  Remove it.  While at it, upgrade the btaprompt parameter to a
full fledged bool instead of an int.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Patch ("kdb: Remove unused "argcount" param from...") new for v3.

Changes in v2: None

 kernel/debug/kdb/kdb_bt.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/kernel/debug/kdb/kdb_bt.c b/kernel/debug/kdb/kdb_bt.c
index 7e2379aa0a1e..120fc686c919 100644
--- a/kernel/debug/kdb/kdb_bt.c
+++ b/kernel/debug/kdb/kdb_bt.c
@@ -78,8 +78,7 @@ static void kdb_show_stack(struct task_struct *p, void *addr)
  */
 
 static int
-kdb_bt1(struct task_struct *p, unsigned long mask,
-	int argcount, int btaprompt)
+kdb_bt1(struct task_struct *p, unsigned long mask, bool btaprompt)
 {
 	char buffer[2];
 	if (kdb_getarea(buffer[0], (unsigned long)p) ||
@@ -106,7 +105,6 @@ int
 kdb_bt(int argc, const char **argv)
 {
 	int diag;
-	int argcount = 5;
 	int btaprompt = 1;
 	int nextarg;
 	unsigned long addr;
@@ -125,7 +123,7 @@ kdb_bt(int argc, const char **argv)
 		/* Run the active tasks first */
 		for_each_online_cpu(cpu) {
 			p = kdb_curr_task(cpu);
-			if (kdb_bt1(p, mask, argcount, btaprompt))
+			if (kdb_bt1(p, mask, btaprompt))
 				return 0;
 		}
 		/* Now the inactive tasks */
@@ -134,7 +132,7 @@ kdb_bt(int argc, const char **argv)
 				return 0;
 			if (task_curr(p))
 				continue;
-			if (kdb_bt1(p, mask, argcount, btaprompt))
+			if (kdb_bt1(p, mask, btaprompt))
 				return 0;
 		} kdb_while_each_thread(g, p);
 	} else if (strcmp(argv[0], "btp") == 0) {
@@ -148,7 +146,7 @@ kdb_bt(int argc, const char **argv)
 		p = find_task_by_pid_ns(pid, &init_pid_ns);
 		if (p) {
 			kdb_set_current_task(p);
-			return kdb_bt1(p, ~0UL, argcount, 0);
+			return kdb_bt1(p, ~0UL, false);
 		}
 		kdb_printf("No process with pid == %ld found\n", pid);
 		return 0;
@@ -159,7 +157,7 @@ kdb_bt(int argc, const char **argv)
 		if (diag)
 			return diag;
 		kdb_set_current_task((struct task_struct *)addr);
-		return kdb_bt1((struct task_struct *)addr, ~0UL, argcount, 0);
+		return kdb_bt1((struct task_struct *)addr, ~0UL, false);
 	} else if (strcmp(argv[0], "btc") == 0) {
 		unsigned long cpu = ~0;
 		struct task_struct *save_current_task = kdb_current_task;
@@ -211,7 +209,7 @@ kdb_bt(int argc, const char **argv)
 			kdb_show_stack(kdb_current_task, (void *)addr);
 			return 0;
 		} else {
-			return kdb_bt1(kdb_current_task, ~0UL, argcount, 0);
+			return kdb_bt1(kdb_current_task, ~0UL, false);
 		}
 	}
 
-- 
2.23.0.351.gc4317032e6-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
