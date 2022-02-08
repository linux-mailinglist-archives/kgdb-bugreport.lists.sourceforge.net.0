Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 505E14AF734
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  9 Feb 2022 17:50:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nHqAZ-00038B-1R
	for lists+kgdb-bugreport@lfdr.de; Wed, 09 Feb 2022 16:50:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <msuchanek@suse.de>) id 1nHVPx-0001Gi-53
 for kgdb-bugreport@lists.sourceforge.net; Tue, 08 Feb 2022 18:40:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jdw+TI4CIqxgVnyNgubuTkK3R4ZTBSmLHhOkGr2VwbM=; b=Y7rDHpRJPjl8H1Xt7iIU+ioGsP
 toL2f7JEhPdJBC+/q/BwGTdx59t507YjOnVNo5EH4sGGYRPw6Wc6mD6oTt6CIkmWzyIYlLgvzM3Ug
 SD7ndn4CJ5G4bKpnbt0l217lXHVBDmds21NFgGO/4tnZeBWplYNTpjkfX+wj0ocQSfFo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jdw+TI4CIqxgVnyNgubuTkK3R4ZTBSmLHhOkGr2VwbM=; b=HxtAfkPfs8QFWBRfJfqhSYjbvf
 WRJL/38tyoaqUuWbImzgnCQI3Dc8+Gi+/MXtwfV7R/6rEyj72WIB1fF1qrjW/m40XLsj5oC2qJndM
 y5yrCynOwHjZLxmELg5SiL7s+XWYUc2wQ/NO56kGdULUithPRT+sgTsNntgjOtHyZ1oA=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nHVPu-00AGMD-LS
 for kgdb-bugreport@lists.sourceforge.net; Tue, 08 Feb 2022 18:40:43 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 8DE1D1F387;
 Tue,  8 Feb 2022 18:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644345630; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jdw+TI4CIqxgVnyNgubuTkK3R4ZTBSmLHhOkGr2VwbM=;
 b=G2S7x10Mrrf2/Pa/VZkTCIlv7iL0i+FD2NbkgDsTy/GD6Vznw+so0ylyvTh9qrR6r7J93J
 04Ue5FWUdyaq6uRCuCrIoSwIjWj/LQNqtOZKyN/cL79m8zoUd2cQQSWFaHW3YME2Nsl1R1
 /O6De15sOs6wELkTrUGF3GPKQ8cJHsc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644345630;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jdw+TI4CIqxgVnyNgubuTkK3R4ZTBSmLHhOkGr2VwbM=;
 b=JP21ChhnYhMUXNASGjs5KkXOyZc8Vg8hIeeV8nPZmnJizD+KuyALDb9msBVTnWZdZTjGOt
 xeQkzWNQ/EVRJkBA==
Received: from kunlun.suse.cz (unknown [10.100.128.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 236BDA3B84;
 Tue,  8 Feb 2022 18:40:30 +0000 (UTC)
Date: Tue, 8 Feb 2022 19:40:29 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Luis Chamberlain <mcgrof@kernel.org>
Message-ID: <20220208184029.GB3113@kunlun.suse.cz>
References: <cover.1643475473.git.christophe.leroy@csgroup.eu>
 <b59ed8781ef9af995c5bfa762de1f42fdfc57c74.1643475473.git.christophe.leroy@csgroup.eu>
 <YfsbcXD74BwJ9ci2@bombadil.infradead.org>
 <228849f5-f6a4-eb45-5e1e-a9b3eccb28b3@csgroup.eu>
 <YfwyKR1xFaApWjRb@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YfwyKR1xFaApWjRb@bombadil.infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hello, On Thu, Feb 03, 2022 at 11:51:05AM -0800, Luis Chamberlain
    wrote: > On Thu, Feb 03, 2022 at 07:05:13AM +0000, Christophe Leroy wrote:
    > > Le 03/02/2022 à 01:01, Luis Chamberlain a écrit : > > > On Sat [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
                             low trust
                             [195.135.220.29 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nHVPu-00AGMD-LS
X-Mailman-Approved-At: Wed, 09 Feb 2022 16:50:12 +0000
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
 Jessica Yu <jeyu@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Lucas De Marchi <lucas.de.marchi@gmail.com>,
 Jason Wessel <jason.wessel@windriver.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Aaron Tomlin <atomlin@redhat.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hello,

On Thu, Feb 03, 2022 at 11:51:05AM -0800, Luis Chamberlain wrote:
> On Thu, Feb 03, 2022 at 07:05:13AM +0000, Christophe Leroy wrote:
> > Le 03/02/2022 =E0 01:01, Luis Chamberlain a =E9crit=A0:
> > > On Sat, Jan 29, 2022 at 05:02:09PM +0000, Christophe Leroy wrote:
> > >> diff --git a/kernel/module.c b/kernel/module.c
> > >> index 11f51e17fb9f..f3758115ebaa 100644
> > >> --- a/kernel/module.c
> > >> +++ b/kernel/module.c
> > >> @@ -81,7 +81,9 @@
> > >>   /* If this is set, the section belongs in the init part of the mod=
ule */
> > >>   #define INIT_OFFSET_MASK (1UL << (BITS_PER_LONG-1))
> > >>   =

> > >> +#ifndef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
> > >>   #define	data_layout core_layout
> > >> +#endif
> > >>   =

> > >>   /*
> > >>    * Mutex protects:
> > >> @@ -111,6 +113,12 @@ static struct mod_tree_root {
> > >>   #define module_addr_min mod_tree.addr_min
> > >>   #define module_addr_max mod_tree.addr_max
> > >>   =

> > >> +#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
> > >> +static struct mod_tree_root mod_data_tree __cacheline_aligned =3D {
> > >> +	.addr_min =3D -1UL,
> > >> +};
> > >> +#endif
> > >> +
> > >>   #ifdef CONFIG_MODULES_TREE_LOOKUP
> > >>   =

> > >>   /*
> > >> @@ -186,6 +194,11 @@ static void mod_tree_insert(struct module *mod)
> > >>   	__mod_tree_insert(&mod->core_layout.mtn, &mod_tree);
> > >>   	if (mod->init_layout.size)
> > >>   		__mod_tree_insert(&mod->init_layout.mtn, &mod_tree);
> > >> +
> > >> +#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
> > >> +	mod->data_layout.mtn.mod =3D mod;
> > >> +	__mod_tree_insert(&mod->data_layout.mtn, &mod_data_tree);
> > >> +#endif
> > > =

> > > =

> > > kernel/ directory has quite a few files, module.c is the second to
> > > largest file, and it has tons of stuff. Aaron is doing work to
> > > split things out to make code easier to read and so that its easier
> > > to review changes. See:
> > > =

> > > https://lkml.kernel.org/r/20220130213214.1042497-1-atomlin@redhat.com
> > > =

> > > I think this is a good patch example which could benefit from that wo=
rk.
> > > So I'd much prefer to see that work go in first than this, so to see =
if
> > > we can make the below changes more compartamentalized.
> > > =

> > > Curious, how much testing has been put into this series?
> > =

> > =

> > I tested the change up to (including) patch 4 to verify it doesn't =

> > introduce regression when not using =

> > CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC,
> =

> > Then I tested with patch 5. I first tried with the 'hello world' test =

> > module. After that I loaded several important modules and checked I =

> > didn't get any regression, both with and without STRICT_MODULES_RWX and =

> > I checked the consistency in /proc/vmallocinfo
> >   /proc/modules /sys/class/modules/*
> =

> I wonder if we have a test for STRICT_MODULES_RWX.
> =

> > I also tested with a hacked module_alloc() to force branch trampolines.
> =

> So to verify that reducing these trampolines actually helps on an
> architecture? I wonder if we can generalize this somehow to let archs
> verify such strategies can help.
> =

> I was hoping for a bit more wider testing, like actually users, etc.
> It does not seem like so. So we can get to that by merging this soon
> into modules-next and having this bleed out issues with linux-next.
> We are in good time to do this now.
> =

> The kmod tree has tons of tests:
> =

> https://git.kernel.org/pub/scm/utils/kernel/kmod/kmod.git/
> =

> Can you use that to verify there are no regressions?

openSUSE has the testsuite packaged so it's easy to run on arbitrary
kernel but only on ppc64(le) because there is no ppc there anymore.

So yes, it does not regress Book3S/64 as far as kmod testsuite is
conderned and building s390x non-modular kernel also still worka but
that's not saying much.

Thanks

Michal


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
