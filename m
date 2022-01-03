Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A014838FD
	for <lists+kgdb-bugreport@lfdr.de>; Tue,  4 Jan 2022 00:13:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1n4WVz-0002V2-6x
	for lists+kgdb-bugreport@lfdr.de; Mon, 03 Jan 2022 23:13:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <corbet@lwn.net>) id 1n4WVw-0002Uw-Kd
 for kgdb-bugreport@lists.sourceforge.net; Mon, 03 Jan 2022 23:13:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=57DOnsHkp6F6pWieveQyXYk5iIi/v1runbJrZXw/4VE=; b=MoVMJwPxDRocgJXoX0g3cTEIH
 RQZGdUkUsHsrw5bs/VLo66CsITd+m8JF6owzy7Rtaem/ZEPO7u/35U/F6k2ebr3C0EQLWPdYDoU0+
 7fpTksTAsh+7Oyn601094rUPmQFq6ZEZphfJftIxErDWc9SEmm/nsz1C7LtLqa44HenAA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=57DOnsHkp6F6pWieveQyXYk5iIi/v1runbJrZXw/4VE=; b=CNm8AVBMAherHjbO/KS1uzgtRt
 3BdHlPlfU9d3HHcUsicBzFgEtTqlEvq27tNDRcfUdkA2Q0ZFL8R4vp0KQrIzzS2K7yKlcQl26wQDP
 i9BafVJ3z42b+/AlcgSEwflTeUqll0ndEpuzXxWcJVUEuNLzMkzI9EUl2WWOatvrPUgE=;
Received: from ms.lwn.net ([45.79.88.28])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1n4WVr-001G8q-SM
 for kgdb-bugreport@lists.sourceforge.net; Mon, 03 Jan 2022 23:13:16 +0000
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 1D586380;
 Mon,  3 Jan 2022 22:54:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1D586380
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1641250453; bh=57DOnsHkp6F6pWieveQyXYk5iIi/v1runbJrZXw/4VE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=e4bDG513Mc5SgGECKgT06qN3LSneMzpP20W2iREzPLWjTRr0+AYXPxgZilaF0oLIW
 l4+rbZLHYqgGm6WMHm85TtNFFYp6vGcCoN735enOt4HZChJih9J+vUVsoZj5Hj6kq3
 i1hrTBi1MRseGqfqGvhLjEV5sAs0ppbtUH1CKoGLI7W+TCTgnnTwpHSp6sXbcllVoc
 SF9LCN2Mmqdx+AHRGbfxG7wo7dqPX4/DYT+KOz3YgUEGvyQC+gzBcDWaE5wGZJlioZ
 EZm/qcRdY6Yn2lzVL4HVx72S4VRjgxsHrUnBCLCrL0ONGBc7GyBbJzNSIHPf01/hEV
 eVNOiKG+1GNGw==
From: Jonathan Corbet <corbet@lwn.net>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Jason Wessel
 <jason.wessel@windriver.com>, Daniel Thompson
 <daniel.thompson@linaro.org>, Douglas Anderson <dianders@chromium.org>,
 kgdb-bugreport@lists.sourceforge.net, linux-doc@vger.kernel.org
In-Reply-To: <20211230172423.30430-1-lukas.bulwahn@gmail.com>
References: <20211230172423.30430-1-lukas.bulwahn@gmail.com>
Date: Mon, 03 Jan 2022 15:54:15 -0700
Message-ID: <87a6gcxwfc.fsf@meer.lwn.net>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Lukas Bulwahn <lukas.bulwahn@gmail.com> writes: > Most
 readers
 are probably going to figure out that the config is actually > all upper-case
 letters, as all Kconfig symbols are this way. > > Properly capitalizing makes
 the script ./scripts/checkkco [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [45.79.88.28 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1n4WVr-001G8q-SM
Subject: Re: [Kgdb-bugreport] [PATCH] Documentation: kgdb: properly
 capitalize the MAGIC_SYSRQ config
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
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Lukas Bulwahn <lukas.bulwahn@gmail.com> writes:

> Most readers are probably going to figure out that the config is actually
> all upper-case letters, as all Kconfig symbols are this way.
>
> Properly capitalizing makes the script ./scripts/checkkconfigsymbols.py
> happy, which otherwise would report this as a reference to a non-existing
> Kconfig symbol.
>
> So, use the right capitalization for the MAGIC_SYSRQ config in the kgdb
> documentation.
>
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---
>  Documentation/dev-tools/kgdb.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks.

jon


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
