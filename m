Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 18792A011BC
	for <lists+kgdb-bugreport@lfdr.de>; Sat,  4 Jan 2025 03:07:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tTtZd-0000P0-SG
	for lists+kgdb-bugreport@lfdr.de;
	Sat, 04 Jan 2025 02:07:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mcgrof@kernel.org>) id 1tTtZc-0000Or-Da
 for kgdb-bugreport@lists.sourceforge.net;
 Sat, 04 Jan 2025 02:07:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MTyz2BPeDLlTIHhsSWuHdu+mofZpbwj9qrtZn/7HLec=; b=MPo3hD7cXp+AVw4tA7yEj/STaN
 /72FPm2M/FL3N0zH9xtK4IpHfrF/cMsY9Atl9YglL8rU3YumFuzcWgHbC4orNHfkCXSvdFXN5nyUN
 rarvDF4m/6vq/BNmd8iP6vlk5BYDGyXFwOcKjCJT6ISsQI9aKIu/KIXehXIoSPV3Bc0s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MTyz2BPeDLlTIHhsSWuHdu+mofZpbwj9qrtZn/7HLec=; b=jIFXyz8Nl/TQz4+9W99Lu2fX6M
 gDN+dLsR1b58a/TWIVsPQsuCXkXDGFZNS97ZkFD4QO8BS8qIoG31MwjqQU1Q5cQXaGmZRwHrucT4f
 7PTCHwHlCegvFJTmFfwcXVZ+cmmCeKyhq4861j8DgOlhaF18FIi8d2tS8zqGLPx+572Y=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tTtZb-0000ZC-OT for kgdb-bugreport@lists.sourceforge.net;
 Sat, 04 Jan 2025 02:07:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 79CED5C5E2D;
 Sat,  4 Jan 2025 02:06:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56E24C4CED6;
 Sat,  4 Jan 2025 02:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1735956445;
 bh=5+k5XIDfmklKhyQNZnytCq6Wbtr3vAtBCZfKfKHl6CA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=joD0NAbRBPE0lezKTTDP1O/kr2E6iJf9COWb+q26eFjVoffuI5L/uXxAbsoYlryoQ
 fYP/yaVyXmntFcDd1a3Fy5BzamjHbURSTyP3IdaXyhV79hmDEblPiZtS6iVgzwGlo3
 Kx4vTa/nHoqIBT7WaRKz0y7zXQ0mNg/SZWWNqb701SX3cdNH0ZRCTN14xhyhSGJ8Pg
 cXiLSChUUEnHpXT+4yMfzWCREm/wGuuwBvwu0rahfPZ8BSGvXEuUhX3QReboXWGoBI
 95VoZXg6cVJmIgpcGSWX14DR8XQkeIf/4vXIKDW+eMgmO5cxqmChke6AdKsiTp7rM/
 m8eDNhFD+TAEA==
Date: Fri, 3 Jan 2025 18:07:22 -0800
To: =?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
 Marek =?utf-8?B?TWHFm2xhbmth?= <mmaslanka@google.com>,
 Adam Williamson <awilliam@redhat.com>
Message-ID: <Z3iX2mNtqSYrvYPT@bombadil.infradead.org>
References: <86eba318-464b-4b9b-a79e-64039b17be34@lucifer.local>
 <d48193a3-65fe-4aa9-98f6-dd5869bd9127@citrix.com>
 <9878d90f-faf3-4853-9a79-a21b4f58ab4c@suse.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9878d90f-faf3-4853-9a79-a21b4f58ab4c@suse.com>
X-Spam-Score: -7.4 (-------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Fri, Jan 03, 2025 at 07:58:13AM +0100, Jürgen Groß wrote:
    > On 03.01.25 03:06, Andrew Cooper wrote: > > > Hi Mike, > > > > > > This
    commit is making my intel box not boot in mm-unstable :>) I bisec [...] 
 
 Content analysis details:   (-7.4 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [139.178.84.217 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -2.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tTtZb-0000ZC-OT
Subject: Re: [Kgdb-bugreport] [PATCH 6/8] modules: switch to execmem API for
 remapping as RW and restoring ROX
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
From: Luis Chamberlain via Kgdb-bugreport
 <kgdb-bugreport@lists.sourceforge.net>
Reply-To: Luis Chamberlain <mcgrof@kernel.org>
Cc: mark.rutland@arm.com, luto@kernel.org, peterz@infradead.org,
 kgdb-bugreport@lists.sourceforge.net, dave.hansen@linux.intel.com,
 rmoar@google.com, brendan.higgins@linux.dev, linux-kselftest@vger.kernel.org,
 hpa@zytor.com, live-patching@vger.kernel.org, mbenes@suse.cz, shuah@kernel.org,
 anton.ivanov@cambridgegreys.com, joe.lawrence@redhat.com,
 lorenzo.stoakes@oracle.com, richard@nod.at, x86@kernel.org,
 Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?=
 <marmarek@invisiblethingslab.com>, mingo@redhat.com, danielt@kernel.org,
 samitolvanen@google.com, linux-trace-kernel@vger.kernel.org, pmladek@suse.com,
 petr.pavlu@suse.com, jikos@kernel.org, linux-um@lists.infradead.org,
 mhiramat@kernel.org, rostedt@goodmis.org, da.gomez@samsung.com, bp@alien8.de,
 rppt@kernel.org, davidgow@google.com, tglx@linutronix.de, jpoimboe@kernel.org,
 kunit-dev@googlegroups.com, linux-mm@kvack.org, song@kernel.org,
 Andrew Cooper <andrew.cooper3@citrix.com>, linux-kernel@vger.kernel.org,
 johannes@sipsolutions.net, linux-modules@vger.kernel.org,
 jason.wessel@windriver.com, akpm@linux-foundation.org,
 kirill.shutemov@linux.intel.com
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, Jan 03, 2025 at 07:58:13AM +0100, J=FCrgen Gro=DF wrote:
> On 03.01.25 03:06, Andrew Cooper wrote:
> > > Hi Mike,
> > > =

> > > This commit is making my intel box not boot in mm-unstable :>) I bise=
cted it to
> > > this commit.
> > =

> > For what it's worth, we've found the same under Xen too.
> > =

> > There's one concrete bug in the series, failing to cope with the absence
> > of superpages (fix in
> > https://lore.kernel.org/xen-devel/6bb03333-74ca-4c2c-85a8-72549b85a5b4@=
suse.com/
> > but not formally posted yet AFAICT).
> =

> Now sent out:
> =

> https://lore.kernel.org/lkml/20250103065631.26459-1-jgross@suse.com/T/#u

Thanks, =


Marek, Adam, can you try this patch? Although the reply here is for
another future series being worked on the fix is for commit
2e45474ab14f ("execmem: add support for cache of large ROX pages").

  Luis


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
