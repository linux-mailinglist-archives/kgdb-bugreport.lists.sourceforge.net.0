Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FF7A17AB2
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 21 Jan 2025 10:58:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1taB1L-0004JW-NI
	for lists+kgdb-bugreport@lfdr.de;
	Tue, 21 Jan 2025 09:58:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rppt@kernel.org>) id 1taB1K-0004JQ-HH
 for kgdb-bugreport@lists.sourceforge.net;
 Tue, 21 Jan 2025 09:58:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d2vU3yVbWk+iyIT5+OGlsu0VZIqzMABeI9eBwwMut2I=; b=LoHs9HWseiRbqVGJopNn9BsRvS
 at2FvBf6v0aRn6mtP+n6tYmcoZEZ+b7WTboBx07TPn+3RYfUObgknRFudtFzl0RiF04TrCKp2LnDS
 LroP1G4446j7+3NbqZurb18mzIwCKW01ZGFdyTd0fgpWZIim/byfa+TSHQM8Oj4ka+Go=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=d2vU3yVbWk+iyIT5+OGlsu0VZIqzMABeI9eBwwMut2I=; b=i
 MnazvZtW8idjtR8gr16f/+n5O3KtnrVeLeZx5Qt8bbT2vbQRZBcvjBrQc5j9GJf+obfOy9iHFriAC
 OVm93EEE3CrQE9A6ArlaUZ0NDugSBmlqlveigRujpz0DwLkF3iuUR90Iu1lbU0Z8N66kzooq1fe+9
 HcPrsq8QQo2zgkck=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1taB1J-0000uZ-2g for kgdb-bugreport@lists.sourceforge.net;
 Tue, 21 Jan 2025 09:58:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id C10AAA41431;
 Tue, 21 Jan 2025 09:56:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85B91C4CEDF;
 Tue, 21 Jan 2025 09:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737453479;
 bh=Wme3RadWyvhvMdPRne38RcnHRR4tq7D20M16ECVXgvE=;
 h=From:To:Cc:Subject:Date:From;
 b=rh/HlilriYiUfxxSoSn1Dvm4ive39BJjvEcaYkJPYDB4Bq159WaYziRMj9GttPwV4
 oNJSZE/CM2l9cUTU/sgeYj916s4tKhaxqflrklPGwUoUglcrt8k38IZ3mnKVmfe85Y
 w1gmDK9AOGg0wGUcs/4/ufhN7/imdYoNgMCLLC4f6HA8JR1YIM/ho6/94/W16wKcUh
 HqZ3wE417GufCR++pfx67iGYJhxnZ1tnwT6vt2+4pq4r8W3tAcMQ3/lc3PDxJbju9x
 5DU87NBLb7gkP2FrZ5zr5ekyyUTyizVQkPCFzaKNT9bc5g12mboVzYrIz0bs5KMlAE
 6HjYs6N1b8mgw==
To: x86@kernel.org
Date: Tue, 21 Jan 2025 11:57:29 +0200
Message-ID: <20250121095739.986006-1-rppt@kernel.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: "Mike Rapoport (Microsoft)" <rppt@kernel.org> Hi,
 Following
 Peter's comments [1] these patches rework handling of ROX caches for module
 text allocations. 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1taB1J-0000uZ-2g
Subject: [Kgdb-bugreport] [PATCH v2 00/10] x86/module: rework ROX cache to
 avoid writable copy
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
From: Mike Rapoport via Kgdb-bugreport <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Mike Rapoport <rppt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, kgdb-bugreport@lists.sourceforge.net,
 Dave Hansen <dave.hansen@linux.intel.com>, Rae Moar <rmoar@google.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Brendan Higgins <brendan.higgins@linux.dev>, linux-kselftest@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, live-patching@vger.kernel.org,
 Miroslav Benes <mbenes@suse.cz>, Shuah Khan <shuah@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Joe Lawrence <joe.lawrence@redhat.com>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Richard Weinberger <richard@nod.at>, Ingo Molnar <mingo@redhat.com>,
 Daniel Thompson <danielt@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 linux-trace-kernel@vger.kernel.org, Petr Mladek <pmladek@suse.com>,
 Petr Pavlu <petr.pavlu@suse.com>, Jiri Kosina <jikos@kernel.org>,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 Daniel Gomez <da.gomez@samsung.com>, Borislav Petkov <bp@alien8.de>,
 David Gow <davidgow@google.com>, Thomas Gleixner <tglx@linutronix.de>,
 Josh Poimboeuf <jpoimboe@kernel.org>, kunit-dev@googlegroups.com,
 Song Liu <song@kernel.org>, Johannes Berg <johannes@sipsolutions.net>,
 Luis Chamberlain <mcgrof@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, linux-modules@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Hi,

Following Peter's comments [1] these patches rework handling of ROX caches
for module text allocations. 

Instead of using a writable copy that really complicates alternatives
patching, temporarily remap parts of a large ROX page as RW for the time of
module formation and then restore it's ROX protections when the module is
ready.

To keep the ROX memory mapped with large pages, make set_memory_rox()
capable of restoring large pages (more details are in patch 3).

Since this is really about x86, I believe this should go in via tip tree.

The patches also available in git
https://git.kernel.org/rppt/h/execmem/x86-rox/v9

v2 changes:
* only collapse large mappings in set_memory_rox()
* simplify RW <-> ROX remapping
* don't remove ROX cache pages from the direct map (patch 4)

v1: https://lore.kernel.org/all/20241227072825.1288491-1-rppt@kernel.org

[1] https://lore.kernel.org/all/20241209083818.GK8562@noisy.programming.kicks-ass.net

Kirill A. Shutemov (1):
  x86/mm/pat: restore large ROX pages after fragmentation

Mike Rapoport (Microsoft) (9):
  x86/mm/pat: cpa-test: fix length for CPA_ARRAY test
  x86/mm/pat: drop duplicate variable in cpa_flush()
  execmem: don't remove ROX cache from the direct map
  execmem: add API for temporal remapping as RW and restoring ROX afterwards
  module: introduce MODULE_STATE_GONE
  module: switch to execmem API for remapping as RW and restoring ROX
  Revert "x86/module: prepare module loading for ROX allocations of text"
  module: drop unused module_writable_address()
  x86: re-enable EXECMEM_ROX support

 arch/um/kernel/um_arch.c                      |  11 +-
 arch/x86/Kconfig                              |   1 +
 arch/x86/entry/vdso/vma.c                     |   3 +-
 arch/x86/include/asm/alternative.h            |  14 +-
 arch/x86/include/asm/pgtable_types.h          |   2 +
 arch/x86/kernel/alternative.c                 | 181 ++++++--------
 arch/x86/kernel/ftrace.c                      |  30 ++-
 arch/x86/kernel/module.c                      |  45 ++--
 arch/x86/mm/pat/cpa-test.c                    |   2 +-
 arch/x86/mm/pat/set_memory.c                  | 220 +++++++++++++++++-
 include/linux/execmem.h                       |  31 +++
 include/linux/module.h                        |  22 +-
 include/linux/moduleloader.h                  |   4 -
 include/linux/vm_event_item.h                 |   2 +
 kernel/module/kallsyms.c                      |   8 +-
 kernel/module/kdb.c                           |   2 +-
 kernel/module/main.c                          |  86 ++-----
 kernel/module/procfs.c                        |   2 +-
 kernel/module/strict_rwx.c                    |   9 +-
 kernel/tracepoint.c                           |   2 +
 lib/kunit/test.c                              |   2 +
 mm/execmem.c                                  |  39 ++--
 mm/vmstat.c                                   |   2 +
 samples/livepatch/livepatch-callbacks-demo.c  |   1 +
 .../test_modules/test_klp_callbacks_demo.c    |   1 +
 .../test_modules/test_klp_callbacks_demo2.c   |   1 +
 .../livepatch/test_modules/test_klp_state.c   |   1 +
 .../livepatch/test_modules/test_klp_state2.c  |   1 +
 28 files changed, 442 insertions(+), 283 deletions(-)


base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
-- 
2.45.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
