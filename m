Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E22A1C6D2
	for <lists+kgdb-bugreport@lfdr.de>; Sun, 26 Jan 2025 08:49:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tbxOV-0002PX-Gc
	for lists+kgdb-bugreport@lfdr.de;
	Sun, 26 Jan 2025 07:49:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rppt@kernel.org>) id 1tbxOQ-0002NN-2S
 for kgdb-bugreport@lists.sourceforge.net;
 Sun, 26 Jan 2025 07:49:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+HrNZ99qkNC8KEVuL9mBInkUyujn5g9T+2i2xoZ40eA=; b=C3xrmVVUCYJ/fGWWuyY9Gw4dIC
 kHY8i/JLY8lSGlynFbKMFDSBLoPlcJ6tGppDeO2NkrUD2NJGrL8UW/oL1+jExfwttPGz41y+ChDHi
 MaPbbA2tlxQ3DZR6ZeMXLkXh7zaUcVKC9APZBEdyzo/WJJX9HxS484mX19etXRmAKPMI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+HrNZ99qkNC8KEVuL9mBInkUyujn5g9T+2i2xoZ40eA=; b=d3M92Kx9H/MntmuRJqasIX6LEt
 js/y2j8heLgen7B6EPTw3bMVQccK2CiBnQX3K4h9Yd3PyFp3IbDen/mt5LT4gAgXVuYH7GV7Pc8tr
 JyOQ0AC8fZChFc1uxFZlX7CFh4+z1DKPDpA5x1t1Rvm7Z4F3Jg6ttDjEY/SL5G4tTJUA=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tbxNO-0001ud-Do for kgdb-bugreport@lists.sourceforge.net;
 Sun, 26 Jan 2025 07:48:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 1B329A40135;
 Sun, 26 Jan 2025 07:46:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34FF5C4CEEA;
 Sun, 26 Jan 2025 07:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737877682;
 bh=dDY3jvGc45EmH43gWTWL5MYq9/Q1o2IM8rTUBWv64F4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=t5r4qgbbVp+nn4AwESyq/kRBw7iTmIzwwOhO3g1QZKZPsL1LLunQnJSvESCwGNX31
 fLfPLM9b9UVXxJ1voOhzdE2kaPMQswbGjy8LnTPVrwb6a+JqfwGRg2d2bTNgrVscEe
 wSEIp2UELK9QFXarhTcBem6rAsoeTzDEztXuHCE2IDKD+8q+h8vaMBMOtMBsslCWMI
 LgFtJPlxWPZ4Duaypkzc9ZGfgijEAzwbLYGxqkBN05QJpFrSNxB7AbaKYpR/BrwIrv
 JImzfewDKD/78iXFN+lUP0nSrcuA/GyVpaKeOoJZZ9LFtTqCUm0WT0cIxtZCjp9p3E
 Oz/ejtI5b29RQ==
To: x86@kernel.org
Date: Sun, 26 Jan 2025 09:47:25 +0200
Message-ID: <20250126074733.1384926-2-rppt@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250126074733.1384926-1-rppt@kernel.org>
References: <20250126074733.1384926-1-rppt@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: "Mike Rapoport (Microsoft)" <rppt@kernel.org> The
 CPA_ARRAY
 test always uses len[1] as numpages argument to change_page_attr_set()
 although
 the addresses array is different each iteration of the test loop. 
 Content analysis details:   (-3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tbxNO-0001ud-Do
Subject: [Kgdb-bugreport] [PATCH v3 1/9] x86/mm/pat: cpa-test: fix length
 for CPA_ARRAY test
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

The CPA_ARRAY test always uses len[1] as numpages argument to
change_page_attr_set() although the addresses array is different each
iteration of the test loop.

Replace len[1] with len[i] to have numpages matching the addresses array.

Fixes: ecc729f1f471 ("x86/mm/cpa: Add ARRAY and PAGES_ARRAY selftests")
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 arch/x86/mm/pat/cpa-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/mm/pat/cpa-test.c b/arch/x86/mm/pat/cpa-test.c
index 3d2f7f0a6ed1..ad3c1feec990 100644
--- a/arch/x86/mm/pat/cpa-test.c
+++ b/arch/x86/mm/pat/cpa-test.c
@@ -183,7 +183,7 @@ static int pageattr_test(void)
 			break;
 
 		case 1:
-			err = change_page_attr_set(addrs, len[1], PAGE_CPA_TEST, 1);
+			err = change_page_attr_set(addrs, len[i], PAGE_CPA_TEST, 1);
 			break;
 
 		case 2:
-- 
2.45.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
