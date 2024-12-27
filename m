Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F09BA9FD157
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 27 Dec 2024 08:30:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tR4nf-0006DU-0h
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 27 Dec 2024 07:30:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rppt@kernel.org>) id 1tR4nc-0006DI-Ng
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 27 Dec 2024 07:30:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mVhqgsU2xvF7EXptjIpaUTgDXd0zYOHitWWau0YEx3Y=; b=P8MGne69+8QncZQzuPzKmuLdLy
 9HvxlvHeREKdOccAARcH02rWEHRJ+Rsa9AmzVDOfwtEn2jpAzYrRcYnN5xXv7KHII+kjncauaBPqB
 ypQotX11rOn6QZzintL50NUCvpOSbnAYlyDHwihp8dMkE63Y26ahxeYdFMY0LsBX7zbY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mVhqgsU2xvF7EXptjIpaUTgDXd0zYOHitWWau0YEx3Y=; b=HrunjIUOEZpRZAziQRtuXBq0Vi
 MJBw+6UdG78rUfMB06sBhjB+WI2SgOtr4cWHSJun7ZV/39gKzaEXSrpf2Etksti29kCbTJQISHtWr
 13N1PvZeqmf/Zjg0F3EmaIu9yXsO1c2jcir65Vc+Td2LBh3fRU7oxsljVODH4aGUWGp8=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tR4nV-0007K0-Rb for kgdb-bugreport@lists.sourceforge.net;
 Fri, 27 Dec 2024 07:30:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5DF8DA4120F;
 Fri, 27 Dec 2024 07:28:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14BE3C4CED7;
 Fri, 27 Dec 2024 07:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735284607;
 bh=4TvuKJvEyJTpjYu41+xgE0YbwjdhXodJecvgvQg8Q9g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ojHOLd1jY+IbJlMWHlQqmy11U2unw6udkZruAXzLiwt6p3tf38LSDBsdZlSGAr5Ti
 oWt8KIUmukiINpZQ30rlaQW/esY9vKKs3doeOUrzcy8pW5ZYTPFGO0ZI3gJxReLmOn
 YaQcqvRdKh4p95/gxdtlnhOY0W/KmRAcMm6L8WPojyDC4zVUscK6EE9nVOGL4nLjWR
 r1cjGnKgKxQGMvk4aIJGohIjP0qxuM3ubVIpYcu1eURVo5rELi+KYU6DKD9THakf4i
 3tyThFwaKvxwFltVsRKo7mTf+dPkTgS+g+XxaWhLAOBU/pmfaSEwU9bFMm6R9seeLv
 0fvxg0DCRWzQw==
To: Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 27 Dec 2024 09:28:25 +0200
Message-ID: <20241227072825.1288491-9-rppt@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241227072825.1288491-1-rppt@kernel.org>
References: <20241227072825.1288491-1-rppt@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
 module_writable_address()
 is unused and can be removed. Signed-off-by: Mike Rapoport (Microsoft)
 <rppt@kernel.org>
 --- include/linux/module.h | 10 1 file changed, 10 deletions(-) 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tR4nV-0007K0-Rb
Subject: [Kgdb-bugreport] [PATCH 8/8] module: drop unused
 module_writable_address()
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
 Richard Weinberger <richard@nod.at>, x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>, Daniel Thompson <danielt@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, linux-trace-kernel@vger.kernel.org,
 Petr Mladek <pmladek@suse.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Jiri Kosina <jikos@kernel.org>, linux-um@lists.infradead.org,
 Steven Rostedt <rostedt@goodmis.org>, Daniel Gomez <da.gomez@samsung.com>,
 Borislav Petkov <bp@alien8.de>, David Gow <davidgow@google.com>,
 Thomas Gleixner <tglx@linutronix.de>, Josh Poimboeuf <jpoimboe@kernel.org>,
 kunit-dev@googlegroups.com, Song Liu <song@kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, linux-modules@vger.kernel.org,
 Johannes Berg <johannes@sipsolutions.net>, Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

module_writable_address() is unused and can be removed.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 include/linux/module.h | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index e9fc9d1fa476..222099bb07cf 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -774,11 +774,6 @@ static inline bool is_livepatch_module(struct module *mod)
 
 void set_module_sig_enforced(void);
 
-static inline void *module_writable_address(struct module *mod, void *loc)
-{
-	return loc;
-}
-
 #else /* !CONFIG_MODULES... */
 
 static inline struct module *__module_address(unsigned long addr)
@@ -886,11 +881,6 @@ static inline bool module_is_coming(struct module *mod)
 {
 	return false;
 }
-
-static inline void *module_writable_address(struct module *mod, void *loc)
-{
-	return loc;
-}
 #endif /* CONFIG_MODULES */
 
 #ifdef CONFIG_SYSFS
-- 
2.45.2



_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
