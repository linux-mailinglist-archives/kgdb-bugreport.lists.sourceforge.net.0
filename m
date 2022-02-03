Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6F24A8CB7
	for <lists+kgdb-bugreport@lfdr.de>; Thu,  3 Feb 2022 20:51:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nFi8f-0005qz-Qb
	for lists+kgdb-bugreport@lfdr.de; Thu, 03 Feb 2022 19:51:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mcgrof@infradead.org>) id 1nFi8e-0005qs-No
 for kgdb-bugreport@lists.sourceforge.net; Thu, 03 Feb 2022 19:51:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ft7cClkc6vBpNUXHJ0m3xjhOU7udO/ZG3yRM4g1vYT4=; b=X6gYLgvDfaI7r8gc+YY6OgVfYc
 h1F+UYgXzg9+8Wmi4UhgoirFuysZQnlcmDtkWVVFM5Wtekn4gGFuxvnU9gM/WqYTZ0ddhgooR/9MO
 JAZKLpO1wTSRfRg5l0tl5v4vxZUnKs3wZb2dl7IugoV01s6gUlRoLc6IwAd1sOh2sxPY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ft7cClkc6vBpNUXHJ0m3xjhOU7udO/ZG3yRM4g1vYT4=; b=XjEB4RlFF+sbYDv3azrWTDe6Ox
 pZwmRqEq06XGuPDFhcriGiXx3m8bOlN2S9oMJYT2ABBbh01SUk6mWRluXDPQUeoxBy/nZgks6NgHf
 aZ3h2/plUs01jtRl+2sFAA3XZLlqMwNObPMHzPMpQ5y9sfr7U3ZZ77yVLVCzhSkHIeuw=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nFi8b-00Fa8U-QS
 for kgdb-bugreport@lists.sourceforge.net; Thu, 03 Feb 2022 19:51:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description;
 bh=ft7cClkc6vBpNUXHJ0m3xjhOU7udO/ZG3yRM4g1vYT4=; b=EERLXhvvt+cUvphZ6I2kMdQwAc
 gjUUegQLCgS6JEACSczf7sBm1sx0ciVihEcBEg6gWVwkeuOFzmzWE1IIcpdMUUXszGrQuqLXGzihh
 LeMchQTAwicUQZfUfwK2iMpfkQkiMsn3DWsB1QiR74LXTelFtBWOg1RxqQpd9mrtJf6TSXko8SokG
 LDqGoCCTv/a3N84VLojdahz+Az++nC/dlh+pCXF7cvWQr73/CSO//N38EjPDx8WMmQQ8IX57cCbyh
 eJKVSWYNzH5Z7YDCP3hNbckQeEzhtIKKnUKhBOPdzT69CFjUx+fIyWUbbataKpfPiqQS+5XJN4joB
 +evkUpRQ==;
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.94.2 #2
 (Red Hat Linux)) id 1nFi8H-002dkz-Se; Thu, 03 Feb 2022 19:51:05 +0000
Date: Thu, 3 Feb 2022 11:51:05 -0800
From: Luis Chamberlain <mcgrof@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Lucas De Marchi <lucas.de.marchi@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Aaron Tomlin <atomlin@redhat.com>,
 Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
Message-ID: <YfwyKR1xFaApWjRb@bombadil.infradead.org>
References: <cover.1643475473.git.christophe.leroy@csgroup.eu>
 <b59ed8781ef9af995c5bfa762de1f42fdfc57c74.1643475473.git.christophe.leroy@csgroup.eu>
 <YfsbcXD74BwJ9ci2@bombadil.infradead.org>
 <228849f5-f6a4-eb45-5e1e-a9b3eccb28b3@csgroup.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <228849f5-f6a4-eb45-5e1e-a9b3eccb28b3@csgroup.eu>
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Feb 03, 2022 at 07:05:13AM +0000, Christophe Leroy
    wrote: > > > Le 03/02/2022 à 01:01, Luis Chamberlain a écrit : > > On Sat,
    Jan 29, 2022 at 05:02:09PM +0000, Christophe Leroy wrote: > >> dif [...] 
 
 Content analysis details:   (-2.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [198.137.202.133 listed in list.dnswl.org]
  0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
                             mail domains are different
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1nFi8b-00Fa8U-QS
Subject: Re: [Kgdb-bugreport] [PATCH v3 4/6] modules: Add
 CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 "kgdb-bugreport@lists.sourceforge.net" <kgdb-bugreport@lists.sourceforge.net>,
 Aaron Tomlin <atomlin@redhat.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jessica Yu <jeyu@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Thu, Feb 03, 2022 at 07:05:13AM +0000, Christophe Leroy wrote:
> =

> =

> Le 03/02/2022 =E0 01:01, Luis Chamberlain a =E9crit=A0:
> > On Sat, Jan 29, 2022 at 05:02:09PM +0000, Christophe Leroy wrote:
> >> diff --git a/kernel/module.c b/kernel/module.c
> >> index 11f51e17fb9f..f3758115ebaa 100644
> >> --- a/kernel/module.c
> >> +++ b/kernel/module.c
> >> @@ -81,7 +81,9 @@
> >>   /* If this is set, the section belongs in the init part of the modul=
e */
> >>   #define INIT_OFFSET_MASK (1UL << (BITS_PER_LONG-1))
> >>   =

> >> +#ifndef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
> >>   #define	data_layout core_layout
> >> +#endif
> >>   =

> >>   /*
> >>    * Mutex protects:
> >> @@ -111,6 +113,12 @@ static struct mod_tree_root {
> >>   #define module_addr_min mod_tree.addr_min
> >>   #define module_addr_max mod_tree.addr_max
> >>   =

> >> +#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
> >> +static struct mod_tree_root mod_data_tree __cacheline_aligned =3D {
> >> +	.addr_min =3D -1UL,
> >> +};
> >> +#endif
> >> +
> >>   #ifdef CONFIG_MODULES_TREE_LOOKUP
> >>   =

> >>   /*
> >> @@ -186,6 +194,11 @@ static void mod_tree_insert(struct module *mod)
> >>   	__mod_tree_insert(&mod->core_layout.mtn, &mod_tree);
> >>   	if (mod->init_layout.size)
> >>   		__mod_tree_insert(&mod->init_layout.mtn, &mod_tree);
> >> +
> >> +#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
> >> +	mod->data_layout.mtn.mod =3D mod;
> >> +	__mod_tree_insert(&mod->data_layout.mtn, &mod_data_tree);
> >> +#endif
> > =

> > =

> > kernel/ directory has quite a few files, module.c is the second to
> > largest file, and it has tons of stuff. Aaron is doing work to
> > split things out to make code easier to read and so that its easier
> > to review changes. See:
> > =

> > https://lkml.kernel.org/r/20220130213214.1042497-1-atomlin@redhat.com
> > =

> > I think this is a good patch example which could benefit from that work.
> > So I'd much prefer to see that work go in first than this, so to see if
> > we can make the below changes more compartamentalized.
> > =

> > Curious, how much testing has been put into this series?
> =

> =

> I tested the change up to (including) patch 4 to verify it doesn't =

> introduce regression when not using =

> CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC,

> Then I tested with patch 5. I first tried with the 'hello world' test =

> module. After that I loaded several important modules and checked I =

> didn't get any regression, both with and without STRICT_MODULES_RWX and =

> I checked the consistency in /proc/vmallocinfo
>   /proc/modules /sys/class/modules/*

I wonder if we have a test for STRICT_MODULES_RWX.

> I also tested with a hacked module_alloc() to force branch trampolines.

So to verify that reducing these trampolines actually helps on an
architecture? I wonder if we can generalize this somehow to let archs
verify such strategies can help.

I was hoping for a bit more wider testing, like actually users, etc.
It does not seem like so. So we can get to that by merging this soon
into modules-next and having this bleed out issues with linux-next.
We are in good time to do this now.

The kmod tree has tons of tests:

https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git/

Can you use that to verify there are no regressions?

Aaron, Michal, if you can do the same that'd be appreciated.


  Luis


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
