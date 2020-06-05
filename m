Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 714041EF8DF
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  5 Jun 2020 15:22:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jhCJ0-0007QV-34
	for lists+kgdb-bugreport@lfdr.de; Fri, 05 Jun 2020 13:22:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daniel.thompson@linaro.org>) id 1jhCIr-0007OW-CS
 for kgdb-bugreport@lists.sourceforge.net; Fri, 05 Jun 2020 13:22:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AyRjljUpDkkPT0X2xA5gUgYnRQ59vhQhn5X65KNC7rQ=; b=B9fhg02uiz+KZTOw48/mpXiAbI
 KH9xCU+gqP7SHnSVQvyPG1+igZifEBXspksnPxF9bfqHVeAxF4d0/r41imIHrV8xn60SXenaZg1gE
 JvkAn87fQrkSqQvG9EPLmhI+abfxVNxoJDSVDccMw19Gw7sfrtpF3Z8eLWBeCnBlEwpA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=AyRjljUpDkkPT0X2xA5gUgYnRQ59vhQhn5X65KNC7rQ=; b=P
 qFykU+vdaJfFc09mUrZtSeIuCDwCocB/83GdMtKErI9yn6Oe5UW50ZYPlPlI9xTww9knBZq4pLBSp
 AVYFhQAsUU058ozPt2fJC8z6yGCZPqbe+iKvgsxMQP7pwzAFuDKooergHuMWD6J1bpWV0hs88LW51
 DTux0vC/sJKgW8Q0=;
Received: from mail-wm1-f65.google.com ([209.85.128.65])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jhCIm-006wq7-Al
 for kgdb-bugreport@lists.sourceforge.net; Fri, 05 Jun 2020 13:22:33 +0000
Received: by mail-wm1-f65.google.com with SMTP id d128so9101779wmc.1
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 05 Jun 2020 06:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AyRjljUpDkkPT0X2xA5gUgYnRQ59vhQhn5X65KNC7rQ=;
 b=tWAHvL8W04kR4YL2QU/YKUyrSEk9ARg1cFFClA1ukhQB1s6XrqnCnldv3bY66c6cmT
 fa/LlGyHGZ8bH1ZalJoWS83dLtPEj8gr73UYnWhRarT38YUMwymJeXKXsaXKrBJIYtDL
 2uixWuTe3XwlcDlztHuPlREun36iBUB284UEqkKAHiIKf/jylPAMA2W/VlC3d4lFk5bN
 NAcnJgstabA6TYJ5cvzp2Ix63m1A6/HRPXohHzICl39NxJah2FUqP6lGcTRoY4xfZ7UF
 kgzbf9f01FqsMV7mZCGkbYbjriWUm3LsJ6xspuLj0RNSagObE700+fa2wtc2gnfDMmDD
 lCZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AyRjljUpDkkPT0X2xA5gUgYnRQ59vhQhn5X65KNC7rQ=;
 b=NMmFYrxAGCKZJSBm8ij9eGy5GjpvSOFp6rpx8TkooYSc4zc1J/TFa+Tfen4qAlSCWJ
 SHPicLeNNVjZVVWfc/U70b4O1hY2GFRVBtfqvd+B57JoySMnTMQhJ+uFNZaVhiFlefNI
 AzuOkjrMlNODAxKA9UVZZswf8mmB9ZFFdi+9bLWCZZScFCp+eug82mAvSAf4NALMkfm/
 WjN7R9KBM6BTfMxj9T/UoR4Qe1zdbZzDh3SlDBSFygkIhKPA7HJRbR5/EXzGeNAcu6zi
 exFv2l+p893pHQO74iVle8hSVRaMRfcS7FiAQ1a7KztOq5f5LeAT/Maxghoo9bEBz3Ut
 Va8A==
X-Gm-Message-State: AOAM5303CLm3zFXKu8aDorH87tU9eryb80+n1Hnu+bJiCuujre52Zjqe
 ocDwNptXfI69nBYluHvyMI+OHw==
X-Google-Smtp-Source: ABdhPJyD2N+8/KLPeltMYhSgqYV0q1j45k/hgbvLUvQmsugDxdxYuMfU7CHginJ5acv3Vmlk6qFVzw==
X-Received: by 2002:a1c:7917:: with SMTP id l23mr2905652wme.117.1591363341962; 
 Fri, 05 Jun 2020 06:22:21 -0700 (PDT)
Received: from wychelm.lan
 (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
 by smtp.gmail.com with ESMTPSA id 1sm11419211wmz.13.2020.06.05.06.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 06:22:21 -0700 (PDT)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Jason Wessel <jason.wessel@windriver.com>,
 Douglas Anderson <dianders@chromium.org>
Date: Fri,  5 Jun 2020 14:21:26 +0100
Message-Id: <20200605132130.1411255-1-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
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
X-Headers-End: 1jhCIm-006wq7-Al
Subject: [Kgdb-bugreport] [RFC PATCH 0/4] kgdb: Honour the kprobe blacklist
 when setting breakpoints
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, pmladek@suse.com,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 patches@linaro.org, linux-kernel@vger.kernel.org, sergey.senozhatsky@gmail.com,
 will@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

kgdb has traditionally adopted a no safety rails approach to breakpoint
placement. If the debugger is commanded to place a breakpoint at an
address then it will do so even if that breakpoint results in kgdb
becoming inoperable.

A stop-the-world debugger with memory peek/poke does intrinsically
provide its operator with the means to hose their system in all manner
of exciting ways (not least because stopping-the-world is already a DoS
attack ;-) ) but the current no safety rail approach is not easy to
defend, especially given kprobes provides us with plenty of machinery to
mark parts of the kernel where breakpointing is discouraged.

This patchset introduces some safety rails by using the existing
kprobes infrastructure. It does not cover all locations where
breakpoints can cause trouble but it will definitely block off several
avenues, including the architecture specific parts that are handled by
arch_within_kprobe_blacklist().

This patch is an RFC because:

1. My workstation is still chugging through the compile testing.

2. Patch 4 needs more runtime testing.

3. The code to extract the kprobe blacklist code (patch 4 again) needs
   more review especially for its impact on arch specific code.

To be clear I do plan to do the detailed review of the kprobe blacklist
stuff but would like to check the direction of travel first since the
change is already surprisingly big and maybe there's a better way to
organise things.


Daniel.


Daniel Thompson (4):
  kgdb: Honour the kprobe blacklist when setting breakpoints
  kgdb: Use the kprobe blacklist to limit single stepping
  kgdb: Add NOKPROBE labels on the trap handler functions
  kprobes: Allow the kprobes blacklist to be compiled independently

 arch/Kconfig                            |   6 +-
 arch/arm/probes/kprobes/Makefile        |   1 +
 arch/arm/probes/kprobes/blacklist.c     |  37 ++++
 arch/arm/probes/kprobes/core.c          |  10 -
 arch/powerpc/kernel/Makefile            |   1 +
 arch/powerpc/kernel/kprobes-blacklist.c |  34 ++++
 arch/powerpc/kernel/kprobes.c           |   8 -
 include/asm-generic/kprobes.h           |   2 +-
 include/asm-generic/vmlinux.lds.h       |   2 +-
 include/linux/kgdb.h                    |   1 +
 include/linux/kprobes.h                 |  29 ++-
 kernel/Makefile                         |   1 +
 kernel/debug/debug_core.c               |  31 +++
 kernel/debug/gdbstub.c                  |  10 +-
 kernel/debug/kdb/kdb_bp.c               |  17 +-
 kernel/debug/kdb/kdb_main.c             |  10 +-
 kernel/kprobes.c                        | 204 +------------------
 kernel/kprobes_blacklist.c              | 260 ++++++++++++++++++++++++
 lib/Kconfig.kgdb                        |   1 +
 19 files changed, 427 insertions(+), 238 deletions(-)
 create mode 100644 arch/arm/probes/kprobes/blacklist.c
 create mode 100644 arch/powerpc/kernel/kprobes-blacklist.c
 create mode 100644 kernel/kprobes_blacklist.c

--
2.25.4



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
