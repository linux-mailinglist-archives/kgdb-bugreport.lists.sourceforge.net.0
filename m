Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 429CD4AF733
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  9 Feb 2022 17:50:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nHqAY-000385-Vy
	for lists+kgdb-bugreport@lfdr.de; Wed, 09 Feb 2022 16:50:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <mbenes@suse.cz>) id 1nD7ZV-0008Fw-No
 for kgdb-bugreport@lists.sourceforge.net; Thu, 27 Jan 2022 16:24:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:Message-ID:
 In-Reply-To:Subject:cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dff1mehmwy7lYfM1LSu0jEYbA2aOIzDLjNE1uhGynPU=; b=FZq1RkPhF9oRNVppujGn7AeQBa
 uN9lsE+GFuMDoiMhyGqbchSlf+qJKjZrveYJYLZKarExFGbjkcTVzyjyNWJ0+PI5fb59ZiDidvFON
 ehHD67CFbfPO6+NEqmlJA63fbn7/kuTAxucg0zfhQWqVVcE6SGjcZtF1wp+g0iv20rrI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:Message-ID:In-Reply-To:Subject:cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dff1mehmwy7lYfM1LSu0jEYbA2aOIzDLjNE1uhGynPU=; b=BhysN076QneFMXFrpefaw50eO2
 gcAMjQKcmjqNlg9cZcABWTHmXdVbnnuSrC5wFbOpx/cxejTjNU7lhFENf707lhlogL7XIOGbvLoii
 IOqS7NDJufFaU3WBbRpwoyDVY0/OFbzTs/VsG8qioNKXoWdV+vKS47Z11895k2FtbEJM=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1nD7ZR-00Gehf-8i
 for kgdb-bugreport@lists.sourceforge.net; Thu, 27 Jan 2022 16:24:28 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 355801F3A9;
 Thu, 27 Jan 2022 16:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1643299546; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dff1mehmwy7lYfM1LSu0jEYbA2aOIzDLjNE1uhGynPU=;
 b=TlM0+ND9JjYYgVXvFx2Z+bO2cn/xPc2sEla+MbumW2dsnjVCspjF5/RPHLXN4NRS2VB39i
 afmZ+9Pkm5wrGeW+q66bEA3ojcrK1z9qThU7+PyLV2fXIaMfZCnnP8MBfC9AHZukPYjWGM
 eg2qPWoLk3vvoTmyaob7wgF4Qs1+qeo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1643299546;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dff1mehmwy7lYfM1LSu0jEYbA2aOIzDLjNE1uhGynPU=;
 b=wKReWxNyajYBEJ/WJJM9qBosVQmFTr9W/2Yehih5rr39+B6Laphi6/utBYgwtcWNCTrAuR
 x9pJ8+gp64UKo5Aw==
Received: from pobox.suse.cz (pobox.suse.cz [10.100.2.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 16D81A3B84;
 Thu, 27 Jan 2022 16:05:45 +0000 (UTC)
Date: Thu, 27 Jan 2022 17:05:45 +0100 (CET)
From: Miroslav Benes <mbenes@suse.cz>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <848d857871f457f4df37e80fad468d615b237c24.1643015752.git.christophe.leroy@csgroup.eu>
Message-ID: <alpine.LSU.2.21.2201271704470.26559@pobox.suse.cz>
References: <cover.1643015752.git.christophe.leroy@csgroup.eu>
 <848d857871f457f4df37e80fad468d615b237c24.1643015752.git.christophe.leroy@csgroup.eu>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > @@ -195, 6 +208,
 9 @@ static void mod_tree_remove(struct module
 *mod) > { > __mod_tree_remove(&mod->core_layout.mtn, &mod_tree);
 > mod_tree_remove_init(mod); 
 > +#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_I [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1nD7ZR-00Gehf-8i
X-Mailman-Approved-At: Wed, 09 Feb 2022 16:50:12 +0000
Subject: Re: [Kgdb-bugreport] [PATCH 6/7] modules: Add
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
 Jason Wessel <jason.wessel@windriver.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Jessica Yu <jeyu@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

> @@ -195,6 +208,9 @@ static void mod_tree_remove(struct module *mod)
>  {
>  	__mod_tree_remove(&mod->core_layout.mtn, &mod_tree);
>  	mod_tree_remove_init(mod);
> +#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
> +	__mod_tree_remove(&mod->core_layout.mtn, &mod_data_tree);

s/core_layout/data_layout/ ?

> +#endif
>  }

Miroslav


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
