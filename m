Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2194F1AF4FC
	for <lists+kgdb-bugreport@lfdr.de>; Sat, 18 Apr 2020 22:49:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1By5/GLLpUJ9LNrZgNn8VuW5aykgUQZQh6K8IXLWYJM=; b=SQLxVM22HOoQzkWZ3lBUBsAYlu
	r5I8gGWgrejAtcYmmlC/zb4GgeajORGcL/Rlo3UwdFJ+Ex2bY7y5Ew/q/2FjM1pjx+llBENtxYQtT
	E5mkOx5zfmGalOIN/Au2o3092d8X7N7Z36WjtJ7rLFKAhp8AEsJWBG4ljFqBmXKhDNBc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1jPuPK-0005F6-TC
	for lists+kgdb-bugreport@lfdr.de; Sat, 18 Apr 2020 20:49:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dima@arista.com>) id 1jPuPJ-0005Er-6S
 for kgdb-bugreport@lists.sourceforge.net; Sat, 18 Apr 2020 20:49:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jZu2SG2CC0n9e6bY0OW4NrZkgCkX838M7bfDqNvau2s=; b=QC+zLrqZJX+FEDvkEeJV1Smi63
 1pyAqP+CUOfKjdDBh0yEnUlNaND0EKScI8PazfWUDvXg1ezY558JYCHaVzr6uZPFW1rIUvIQJbQfD
 tsT9VFRg1jUWh4O6l+Y4pK2HYVTWODU4hm6jUj9lsW/XIJpeXMvpuavGpcEjr0Joo4gY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jZu2SG2CC0n9e6bY0OW4NrZkgCkX838M7bfDqNvau2s=; b=b
 JfE/qzE7sE23hbswwRHGmslf1fNgdO2VKkDRuaSZJ4Kr1fCHIGF80AzCMey3DFKT9aUq+FDBsLMIr
 8sQ0QfbNXoLv+pPf18uxF4uqT0LR+eTE7G+i+JTl4y5O5+7tV0br70n+5vGQy9vKvRAHAOQjLfdkI
 lwixjEbfWWxdxbBg=;
Received: from mail-wm1-f68.google.com ([209.85.128.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jPuPH-0033vf-CL
 for kgdb-bugreport@lists.sourceforge.net; Sat, 18 Apr 2020 20:49:45 +0000
Received: by mail-wm1-f68.google.com with SMTP id g12so6836863wmh.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Sat, 18 Apr 2020 13:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arista.com; s=googlenew;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jZu2SG2CC0n9e6bY0OW4NrZkgCkX838M7bfDqNvau2s=;
 b=NtWMGxm5Z5KL60IcA5G6+HePF4i0/+hybqLX4fP2XMV4pk2XK/oJgFwY9QTP7vjDcS
 5rwxVW1+vHKUvZUBrN7R1Jm5os3oCs5jvHX41VQ5J2K9Y+GI66NfmYOUEkhyxC+rjZg7
 2GfsY1ICyicOKD9p22ci+KNPTEheYKJMkOJUNpoxfOXV+MY7Nfvt7+EMftdBGU8cAV7Z
 Hc5O1LA9T9GP/asJoaPI+CZlJFXlG6W/t2lsj8SpH+N8Lys5LxM4YnccVfQhfWVsNDrM
 t9gj0wsuKk0zluKdzjzbtHVloZk5oDJD4LvQFErIsDvme+gEa5teq5SfPrxjPtC9exZQ
 O63A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jZu2SG2CC0n9e6bY0OW4NrZkgCkX838M7bfDqNvau2s=;
 b=E3++W8Oo1Z6k6IravM/mqqcdrpjqIkBh4FNZXjG7uqyse/fV174lyzjweaBcIZx5M6
 KJaE4g1jSrbLaDFARf9/VI/hQM6JlkybCLuIMtvT0uL+EvZV2c8J3vVnuHvn01rblmQR
 amYVY8/fzTnmlsS1GY5PhuEYGbWpM4i73MMGNRFSP0EbhNQ3Ci085gpWu7tKD6F3ex1z
 6l76lU+F16a1cgxjHvtyn/q7hsql0BjHV16/ixtD+B4IrHKfglF9M3aT+Ux8432Fwilj
 JKFDAdq4FsvdG7KaUup1ogfPxj4Q9bIw5OVYUWwmCLlTBXq+LG7an+uaBd++ZqEwOFUO
 T7NQ==
X-Gm-Message-State: AGi0Pua/lc4ENt0jmqj+uBvRrN4mMmeyAGlxy4kHc+M6Z1hn0d8FSn46
 UGrutno2zkaIunn1Xzw5U1YCH/tw8ePFgQ==
X-Google-Smtp-Source: APiQypIu9Ehl1Z9anj4NXd+uZnvSgH6ch0y3g33ZANXWX1DjUHPmY1LH5q1VbQfnVR586X/qqwr8lw==
X-Received: by 2002:a05:600c:210c:: with SMTP id
 u12mr10004137wml.135.1587241189836; 
 Sat, 18 Apr 2020 13:19:49 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8084:e84:2480:228:f8ff:fe6f:83a8])
 by smtp.gmail.com with ESMTPSA id
 m1sm31735255wro.64.2020.04.18.13.19.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Apr 2020 13:19:48 -0700 (PDT)
To: linux-kernel@vger.kernel.org
Date: Sat, 18 Apr 2020 21:18:54 +0100
Message-Id: <20200418201944.482088-1-dima@arista.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linuxfoundation.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.128.68 listed in list.dnswl.org]
 -0.8 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.128.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1jPuPH-0033vf-CL
Subject: [Kgdb-bugreport] [PATCHv3 00/50] Add log level to show_stack()
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
From: Dmitry Safonov via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Dmitry Safonov <dima@arista.com>
Cc: Juri Lelli <juri.lelli@redhat.com>, linux-sh@vger.kernel.org,
 Catalin Marinas <catalin.marinas@arm.com>, Ben Segall <bsegall@google.com>,
 Guo Ren <guoren@kernel.org>, Pavel Machek <pavel@ucw.cz>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Paul Burton <paulburton@kernel.org>, Dmitry Safonov <dima@arista.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Mel Gorman <mgorman@suse.de>,
 Jiri Slaby <jslaby@suse.com>, Matt Turner <mattst88@gmail.com>,
 uclinux-h8-devel@lists.sourceforge.jp, Len Brown <len.brown@intel.com>,
 linux-pm@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-um@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Richard Henderson <rth@twiddle.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Ralf Baechle <ralf@linux-mips.org>,
 Paul Mackerras <paulus@samba.org>, Andrew Morton <akpm@linux-foundation.org>,
 linux-ia64@vger.kernel.org, Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 James Hogan <jhogan@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Vincent Chen <deanbo422@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, linux-s390@vger.kernel.org,
 linux-c6x-dev@linux-c6x.org, Yoshinori Sato <ysato@users.sourceforge.jp>,
 linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
 linux-xtensa@linux-xtensa.org, Vasily Gorbik <gor@linux.ibm.com>,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
 linux-m68k@lists.linux-m68k.org, Stafford Horne <shorne@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Tony Luck <tony.luck@intel.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dmitry Safonov <0x7f454c46@gmail.com>, Will Deacon <will@kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Brian Cain <bcain@codeaurora.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 kgdb-bugreport@lists.sourceforge.net, linux-snps-arc@lists.infradead.org,
 Fenghua Yu <fenghua.yu@intel.com>, Borislav Petkov <bp@alien8.de>,
 Jeff Dike <jdike@addtoit.com>, Steven Rostedt <rostedt@goodmis.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-parisc@vger.kernel.org,
 linux-alpha@vger.kernel.org, Ley Foon Tan <lftan@altera.com>,
 "David S. Miller" <davem@davemloft.net>, Rich Felker <dalias@libc.org>,
 Petr Mladek <pmladek@suse.com>, Peter Zijlstra <peterz@infradead.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Jonas Bonn <jonas@southpole.se>, Richard Weinberger <richard@nod.at>,
 x86@kernel.org, Russell King <linux@armlinux.org.uk>,
 clang-built-linux@googlegroups.com, Ingo Molnar <mingo@redhat.com>,
 Mark Salter <msalter@redhat.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 openrisc@lists.librecores.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Michal Simek <monstr@monstr.eu>, Vineet Gupta <vgupta@synopsys.com>,
 linux-mips@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Jason Wessel <jason.wessel@windriver.com>,
 nios2-dev@lists.rocketboards.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Changes to v3:
- Collected more architectual Acks and Reviewed-by
- Fixed compilation on sparc64

Changes to v2:
- Removed excessive pr_cont("\n") (nits by Senozhatsky)
- Leave backtrace debugging messages with pr_debug()
  (noted by Russell King and Will Deacon)
- Correct microblaze_unwind_inner() declaration
  (Thanks to Michal Simek and kbuild test robot)
- Fix copy'n'paste typo in show_stack_loglvl() for sparc
  (kbuild robot)
- Fix backtrace output on xtensa
  (Thanks Max Filippov)
- Add loglevel to show_stack() on s390 (kbuild robot)
- Collected all Reviewed-by and Acked-by (thanks!)

v2: https://lore.kernel.org/linux-riscv/20200316143916.195608-1-dima@arista.com/
v1: https://lore.kernel.org/linux-riscv/20191106030542.868541-1-dima@arista.com/

Add log level argument to show_stack().
Done in three stages:
1. Introducing show_stack_loglvl() for every architecture
2. Migrating old users with an explicit log level
3. Renaming show_stack_loglvl() into show_stack()

Justification:
o It's a design mistake to move a business-logic decision
  into platform realization detail.
o I have currently two patches sets that would benefit from this work:
  Removing console_loglevel jumps in sysrq driver [1]
  Hung task warning before panic [2] - suggested by Tetsuo (but he
  probably didn't realise what it would involve).
o While doing (1), (2) the backtraces were adjusted to headers
  and other messages for each situation - so there won't be a situation
  when the backtrace is printed, but the headers are missing because
  they have lesser log level (or the reverse).
o As the result in (2) plays with console_loglevel for kdb are removed.

The least important for upstream, but maybe still worth to note that
every company I've worked in so far had an off-list patch to print
backtrace with the needed log level (but only for the architecture they
cared about).
If you have other ideas how you will benefit from show_stack() with
a log level - please, reply to this cover letter.

See also discussion on v1:
https://lore.kernel.org/linux-riscv/20191106083538.z5nlpuf64cigxigh@pathway.suse.cz/

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Jiri Slaby <jslaby@suse.com>
Cc: Petr Mladek <pmladek@suse.com>
Cc: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>

Thanks,
Dmitry

[1]: https://lore.kernel.org/lkml/20190528002412.1625-1-dima@arista.com/T/#u
[2]: https://lkml.kernel.org/r/41fd7652-df1f-26f6-aba0-b87ebae07db6@i-love.sakura.ne.jp

Dmitry Safonov (50):
  kallsyms/printk: Add loglvl to print_ip_sym()
  alpha: Add show_stack_loglvl()
  arc: Add show_stack_loglvl()
  arm/asm: Add loglvl to c_backtrace()
  arm: Add loglvl to unwind_backtrace()
  arm: Add loglvl to dump_backtrace()
  arm: Wire up dump_backtrace_{entry,stm}
  arm: Add show_stack_loglvl()
  arm64: Add loglvl to dump_backtrace()
  arm64: Add show_stack_loglvl()
  c6x: Add show_stack_loglvl()
  csky: Add show_stack_loglvl()
  h8300: Add show_stack_loglvl()
  hexagon: Add show_stack_loglvl()
  ia64: Pass log level as arg into ia64_do_show_stack()
  ia64: Add show_stack_loglvl()
  m68k: Add show_stack_loglvl()
  microblaze: Add loglvl to microblaze_unwind_inner()
  microblaze: Add loglvl to microblaze_unwind()
  microblaze: Add show_stack_loglvl()
  mips: Add show_stack_loglvl()
  nds32: Add show_stack_loglvl()
  nios2: Add show_stack_loglvl()
  openrisc: Add show_stack_loglvl()
  parisc: Add show_stack_loglvl()
  powerpc: Add show_stack_loglvl()
  riscv: Add show_stack_loglvl()
  s390: Add show_stack_loglvl()
  sh: Add loglvl to dump_mem()
  sh: Remove needless printk()
  sh: Add loglvl to printk_address()
  sh: Add loglvl to show_trace()
  sh: Add show_stack_loglvl()
  sparc: Add show_stack_loglvl()
  um/sysrq: Remove needless variable sp
  um: Add show_stack_loglvl()
  unicore32: Remove unused pmode argument in c_backtrace()
  unicore32: Add loglvl to c_backtrace()
  unicore32: Add show_stack_loglvl()
  x86: Add missing const qualifiers for log_lvl
  x86: Add show_stack_loglvl()
  xtensa: Add loglvl to show_trace()
  xtensa: Add show_stack_loglvl()
  sysrq: Use show_stack_loglvl()
  x86/amd_gart: Print stacktrace for a leak with KERN_ERR
  power: Use show_stack_loglvl()
  kdb: Don't play with console_loglevel
  sched: Print stack trace with KERN_INFO
  kernel: Use show_stack_loglvl()
  kernel: Rename show_stack_loglvl() => show_stack()

 arch/alpha/kernel/traps.c            | 22 +++++++--------
 arch/arc/include/asm/bug.h           |  3 ++-
 arch/arc/kernel/stacktrace.c         | 17 +++++++-----
 arch/arc/kernel/troubleshoot.c       |  2 +-
 arch/arm/include/asm/bug.h           |  3 ++-
 arch/arm/include/asm/traps.h         |  3 ++-
 arch/arm/include/asm/unwind.h        |  3 ++-
 arch/arm/kernel/traps.c              | 39 +++++++++++++++------------
 arch/arm/kernel/unwind.c             |  5 ++--
 arch/arm/lib/backtrace-clang.S       |  9 +++++--
 arch/arm/lib/backtrace.S             | 14 +++++++---
 arch/arm64/include/asm/stacktrace.h  |  3 ++-
 arch/arm64/kernel/process.c          |  2 +-
 arch/arm64/kernel/traps.c            | 17 ++++++------
 arch/c6x/kernel/traps.c              | 16 ++++++-----
 arch/csky/kernel/dumpstack.c         |  9 ++++---
 arch/csky/kernel/ptrace.c            |  4 +--
 arch/h8300/kernel/traps.c            | 12 ++++-----
 arch/hexagon/kernel/traps.c          | 25 ++++++++---------
 arch/ia64/include/asm/ptrace.h       |  1 -
 arch/ia64/kernel/mca.c               |  2 +-
 arch/ia64/kernel/process.c           | 17 ++++++------
 arch/m68k/kernel/traps.c             | 13 ++++-----
 arch/microblaze/include/asm/unwind.h |  3 ++-
 arch/microblaze/kernel/stacktrace.c  |  4 +--
 arch/microblaze/kernel/traps.c       | 12 ++++-----
 arch/microblaze/kernel/unwind.c      | 40 +++++++++++++++++-----------
 arch/mips/kernel/traps.c             | 35 ++++++++++++------------
 arch/nds32/kernel/traps.c            | 15 ++++++-----
 arch/nios2/kernel/traps.c            | 17 ++++++------
 arch/openrisc/kernel/traps.c         | 12 +++++----
 arch/parisc/kernel/traps.c           | 24 ++++++++---------
 arch/powerpc/kernel/process.c        | 15 ++++++-----
 arch/powerpc/kernel/stacktrace.c     |  2 +-
 arch/riscv/kernel/stacktrace.c       |  9 ++++---
 arch/s390/kernel/dumpstack.c         | 13 ++++-----
 arch/sh/include/asm/kdebug.h         |  6 +++--
 arch/sh/include/asm/processor_32.h   |  2 +-
 arch/sh/kernel/dumpstack.c           | 36 ++++++++++++-------------
 arch/sh/kernel/process_32.c          |  2 +-
 arch/sh/kernel/process_64.c          |  3 +--
 arch/sh/kernel/traps.c               |  4 +--
 arch/sh/mm/fault.c                   |  2 +-
 arch/sparc/kernel/process_32.c       | 10 +++----
 arch/sparc/kernel/process_64.c       |  2 +-
 arch/sparc/kernel/traps_64.c         |  9 ++++---
 arch/um/drivers/mconsole_kern.c      |  2 +-
 arch/um/kernel/sysrq.c               | 23 ++++++++--------
 arch/unicore32/kernel/setup.h        |  2 +-
 arch/unicore32/kernel/traps.c        | 34 +++++++++++------------
 arch/unicore32/lib/backtrace.S       | 24 +++++++++++------
 arch/x86/include/asm/stacktrace.h    |  2 +-
 arch/x86/kernel/amd_gart_64.c        |  2 +-
 arch/x86/kernel/dumpstack.c          |  9 ++++---
 arch/xtensa/kernel/traps.c           | 22 ++++++++-------
 drivers/base/power/main.c            |  2 +-
 drivers/tty/sysrq.c                  |  2 +-
 include/linux/kallsyms.h             |  4 +--
 include/linux/sched/debug.h          |  3 ++-
 kernel/debug/kdb/kdb_bt.c            | 15 ++++++-----
 kernel/locking/lockdep.c             |  4 +--
 kernel/locking/rtmutex-debug.c       |  2 +-
 kernel/sched/core.c                  |  8 +++---
 kernel/trace/ftrace.c                |  8 +++---
 lib/dump_stack.c                     |  2 +-
 tools/include/linux/kallsyms.h       |  2 +-
 66 files changed, 375 insertions(+), 315 deletions(-)

-- 
2.26.0



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
