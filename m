Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C88FFF6135
	for <lists+kgdb-bugreport@lfdr.de>; Sat,  9 Nov 2019 20:40:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1iTWbI-0004Sq-KD
	for lists+kgdb-bugreport@lfdr.de; Sat, 09 Nov 2019 19:40:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1iTWbH-0004Si-V0
 for kgdb-bugreport@lists.sourceforge.net; Sat, 09 Nov 2019 19:40:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IkFL+O4AgYFx1OONXesexHJ5CbtF3Jn1N0Qya4xrddw=; b=YnXCf2XSalgXjXU939JVU4QN7g
 3lJFHXQvZ8IWvXhzM3SXKE8yzE7XnRN3Csb30IjHKpBR8n68QaLscndqAkxjfPmyQ35S/RP4RhEnV
 HejKIuRuOeTk4pVPXCO02qxTohqpWh8gXFWhm+O0T7AaBk6sWUZuuni30f5meni0vUJM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=IkFL+O4AgYFx1OONXesexHJ5CbtF3Jn1N0Qya4xrddw=; b=E
 wW1JJ0AtfJ5dPOvy0V0d+5qC1mZV0P1j1VK30Nk7+0emRzy4U5QYTimfH7Ax2lKYMMwLDxG0TxIeL
 +M6w2Fv78BWkg7rXdTwDeoLfeHaexuI9dpfSLl9PzP+kmRGHoqFlw1wGgcMtuLvF9/xUIOdRZRFd9
 2PLEL/9ZHfhm/ux8=;
Received: from mail-pg1-f195.google.com ([209.85.215.195])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iTWbF-009qPY-SF
 for kgdb-bugreport@lists.sourceforge.net; Sat, 09 Nov 2019 19:40:47 +0000
Received: by mail-pg1-f195.google.com with SMTP id 15so6339509pgt.7
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sat, 09 Nov 2019 11:40:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IkFL+O4AgYFx1OONXesexHJ5CbtF3Jn1N0Qya4xrddw=;
 b=YPrLHNngmS1tJAvcSMsgJEZh8HdBQEwSw0bJ8S5ojIqaCdtTh7y7x/8xvEXf2Z00n6
 p++6Y/urc8Z88qhr3eCTXqqZmdpWySEgIEww+jNkXaRb+J2epcucNuHiJuFiHlxW0uKk
 AHYlELgxTqUl9pjpfsdumyOeWgfzdZSuHm8vk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IkFL+O4AgYFx1OONXesexHJ5CbtF3Jn1N0Qya4xrddw=;
 b=cya7OOlbAOGaN+mfvep570tjb89G/ta+1TfEQgD6MwYBi+f2Q9YBbquFbLz7MvqCix
 MtNiqhZ8Cg7+SxLFBmF5wcXZ+3tqek51sS53yXWhe98umQ5ctavLXPypmx+U3+AM6o+z
 IbXfeFQdN7UJi+1c1rVxiMXyj58Mz+dIkkpVXBByWwnh38CEPxQk0LmeVHidgK58NEQH
 7Ywe1bY9j5rkFZ7NlT8AfJKfqlDcJ6/CVOBd/cw9elYjWqslPjbY7GDSxTkQHnTasCs8
 1YWqbTG8iEbz8u10PhrKMidqdfHkwmgdaDx0XLzvTrx/vTcAh7PLPg48ot4F6rOOdaBh
 eZ2w==
X-Gm-Message-State: APjAAAVN2FlZ89jHGQZKI0XJlAOIwDWU8VA7PU84ChigZB8C3Qm4F1vK
 zM28bhub/iYcj8SdPPp1wfpuqr7R3uo=
X-Google-Smtp-Source: APXvYqyTQDUg289HvMjCfRmb7zKuKPtAOHS7ULkRiIVT4D+AHpNRRfK1XQJS7vZzBBWOsf2O8cIF9A==
X-Received: by 2002:a62:1c8:: with SMTP id 191mr20604153pfb.152.1573327068017; 
 Sat, 09 Nov 2019 11:17:48 -0800 (PST)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:1:24fa:e766:52c9:e3b2])
 by smtp.gmail.com with ESMTPSA id i11sm9193577pgd.7.2019.11.09.11.17.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Nov 2019 11:17:47 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: Paul Burton <paul.burton@mips.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <daniel.thompson@linaro.org>
Date: Sat,  9 Nov 2019 11:16:39 -0800
Message-Id: <20191109191644.191766-1-dianders@chromium.org>
X-Mailer: git-send-email 2.24.0.432.g9d3f5f5b63-goog
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.195 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iTWbF-009qPY-SF
Subject: [Kgdb-bugreport] [PATCH 0/5] kdb: Don't implicitly change tasks;
 plus misc fixups
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
Cc: qiaochong@loongson.cn, Prarit Bhargava <prarit@redhat.com>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 kgdb-bugreport@lists.sourceforge.net,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Chuhong Yuan <hslester96@gmail.com>, ralf@linux-mips.org,
 Mike Rapoport <rppt@linux.ibm.com>, Serge Semin <fancer.lancer@gmail.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>,
 Nicholas Mc Guire <hofrat@osadl.org>, James Hogan <jhogan@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mips@vger.kernel.org,
 Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

This started out as just a follow-up to Daniel's post [1].  I wanted
to stop implicitly changing the current task in kdb.  ...but, of
course, everywhere you look in kdb there are things to cleanup, so
this gets a few misc cleanups I found along the way.  Enjoy.

[1] https://lore.kernel.org/r/20191010150735.dhrj3pbjgmjrdpwr@holly.lan


Douglas Anderson (5):
  MIPS: kdb: Remove old workaround for backtracing on other CPUs
  kdb: kdb_current_regs should be private
  kdb: kdb_current_task shouldn't be exported
  kdb: Gid rid of implicit setting of the current task / regs
  kdb: Get rid of confusing diag msg from "rd" if current task has no
    regs

 arch/mips/kernel/traps.c       |  5 -----
 include/linux/kdb.h            |  2 --
 kernel/debug/kdb/kdb_bt.c      |  8 +-------
 kernel/debug/kdb/kdb_main.c    | 31 ++++++++++++++-----------------
 kernel/debug/kdb/kdb_private.h |  2 +-
 5 files changed, 16 insertions(+), 32 deletions(-)

-- 
2.24.0.432.g9d3f5f5b63-goog



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
