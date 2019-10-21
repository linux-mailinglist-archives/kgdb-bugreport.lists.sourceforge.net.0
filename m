Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A40AADE90C
	for <lists+kgdb-bugreport@lfdr.de>; Mon, 21 Oct 2019 12:11:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iMUer-0004jQ-FO
	for lists+kgdb-bugreport@lfdr.de; Mon, 21 Oct 2019 10:11:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1iMUeq-0004jJ-CF
 for kgdb-bugreport@lists.sourceforge.net; Mon, 21 Oct 2019 10:11:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ejY+9Vm9aWJOs97zrA807+W9n/23O9nYbfu1WQqsyN4=; b=jbmgZXD9uPAn89e5iTC9cA8dhE
 FwueD2pW/Erksy3dtOSWdgiuEDkZaHLGYRvPNTHfqAWQgfqIfzp8hlvRdfLXokvu2f6cQgFtqQY7z
 R6X+KXQQUIxxvZ+2PI2bE5EOydDX5bv2+7w0HOrFASskwajDB+i6XdJnxuFfAIKW9thg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ejY+9Vm9aWJOs97zrA807+W9n/23O9nYbfu1WQqsyN4=; b=K
 wa+3LvDUTki6B1duCfqKfw3o9YC8T/GNClsPIhCFd+1KxDdiZnnoFygQ5hNc1Z1FSjaGS+gfGmOiG
 rttUhiORbRtOt2aWSpVCcuRKoASvLjuF3y6xnLaPFFeX+B06y7xHSinuY3TjSEEtFZdKdu1Xn8DIL
 d4BvmsKh+iNH6dSE=;
Received: from mail-wm1-f68.google.com ([209.85.128.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iMUej-00FpEt-9k
 for kgdb-bugreport@lists.sourceforge.net; Mon, 21 Oct 2019 10:11:24 +0000
Received: by mail-wm1-f68.google.com with SMTP id 3so12141915wmi.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 21 Oct 2019 03:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ejY+9Vm9aWJOs97zrA807+W9n/23O9nYbfu1WQqsyN4=;
 b=Z67VptU0dpTYTmG3ohv8pDSd0+CsFi7qspyxYHYbGvD4wdiRDK3vqJVHPZPaqGXGOm
 uiLYWy/FZwE/YhpSsGe+Sl426PcGkC6fMRTzwDAHXswSlrMcjOkTambq8295/tCALvGN
 rKKL5+SWYo8AmXf6bCtgIPSZ2htVNwBaq/RYG1N2EpqnkLXR1qUvuOSfxPAs8j7Wf7kD
 3ll16iGmFYL4xgfA8RE0S8f7n+faLm8GMFfaXf3OxL6zXNAX5JcGExaSdX2c1FHiTUTH
 qMKjwTektqUZvXtXiNWR0tqZbofdwnfpfpP7aVIwRxsGnEe4DScDdboA2uBjKM8tZt8Q
 6KiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ejY+9Vm9aWJOs97zrA807+W9n/23O9nYbfu1WQqsyN4=;
 b=HMAX2Q7EDYVwigMcxvVstAIvGt8kqHMsYCijO3aNiODuIsbWhGucPH/5EtckvxBtJ4
 RcnxUWhT1/YlpHdXsfci+fNmd5PLJpr4uNLv1sJ5z1ft4V4umIqqU4MPKD2Oayeysr4a
 wF9/km2Se0c7+UOr2Gx2b+FaKbI6kLOSl9N0s6DV/U+Ysg1/VsUCUwPssc7fZEPBdY0j
 3RsaXb5nMb1SopZcBwo/Wj0xH7MpFdoTfROEeL/DN+Xnu6egal1ehqQmEU/jg1SJfUGl
 QYhgB/K/D2v4GVkadq+fodUaJiPve53Df+p/Cece6fjRR/V80R2EPD2hGSNuc1ganFNP
 ulxA==
X-Gm-Message-State: APjAAAUyMXK1N2CwK/S1In13itj7UZCPWD5s4aS+JrEjpHQVn+E8ZTLv
 3yLi0lzwzewPpm2hNJagLZS0Eg==
X-Google-Smtp-Source: APXvYqz6f/D7+PFLZCxKK/K5eWFiAXnAStPWGTZJu/8oCjOA5TUh20GOlE1d4q4CuQdJrKGrqV6Xcg==
X-Received: by 2002:a1c:2884:: with SMTP id
 o126mr20068584wmo.153.1571652667359; 
 Mon, 21 Oct 2019 03:11:07 -0700 (PDT)
Received: from wychelm.lan
 (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id j63sm15978535wmj.46.2019.10.21.03.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 03:11:06 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Douglas Anderson <dianders@chromium.org>,
 Jason Wessel <jason.wessel@windriver.com>
Date: Mon, 21 Oct 2019 11:10:56 +0100
Message-Id: <20191021101057.23861-1-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.68 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iMUej-00FpEt-9k
Subject: [Kgdb-bugreport] [PATCH v2] kdb: Avoid array subscript warnings on
 non-SMP builds
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
 Daniel Thompson <daniel.thompson@linaro.org>,
 kbuild test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 patches@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Recent versions of gcc (reported on gcc-7.4) issue array subscript
warnings for builds where SMP is not enabled.

kernel/debug/debug_core.c: In function 'kdb_dump_stack_on_cpu':
kernel/debug/debug_core.c:452:17: warning: array subscript is outside array
+bounds [-Warray-bounds]
     if (!(kgdb_info[cpu].exception_state & DCPU_IS_SLAVE)) {
           ~~~~~~~~~^~~~~
   kernel/debug/debug_core.c:469:33: warning: array subscript is outside array
+bounds [-Warray-bounds]
     kgdb_info[cpu].exception_state |= DCPU_WANT_BT;
   kernel/debug/debug_core.c:470:18: warning: array subscript is outside array
+bounds [-Warray-bounds]
     while (kgdb_info[cpu].exception_state & DCPU_WANT_BT)

There is no bug here but there is scope to improve the code
generation for non-SMP systems (whilst also silencing the warning).

Reported-by: kbuild test robot <lkp@intel.com>
Fixes: 2277b492582d ("kdb: Fix stack crawling on 'running' CPUs that aren't the master")
Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---

Notes:
    Changes in v2:
    
     - Moved the IS_ENABLED(CONFIG_SMP) test to the first (slightly easier
       to read the code, improves code generation a little)
     - Sent out as a proper patch e-mail ;-)

 kernel/debug/debug_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/debug/debug_core.c b/kernel/debug/debug_core.c
index 70e86b4b4932..2b7c9b67931d 100644
--- a/kernel/debug/debug_core.c
+++ b/kernel/debug/debug_core.c
@@ -444,7 +444,7 @@ int dbg_remove_all_break(void)
 #ifdef CONFIG_KGDB_KDB
 void kdb_dump_stack_on_cpu(int cpu)
 {
-	if (cpu == raw_smp_processor_id()) {
+	if (cpu == raw_smp_processor_id() || !IS_ENABLED(CONFIG_SMP)) {
 		dump_stack();
 		return;
 	}
--
2.21.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
