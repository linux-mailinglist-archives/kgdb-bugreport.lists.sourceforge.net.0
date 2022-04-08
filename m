Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 517EB4F9896
	for <lists+kgdb-bugreport@lfdr.de>; Fri,  8 Apr 2022 16:50:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1ncpvx-0001yk-Ra
	for lists+kgdb-bugreport@lfdr.de; Fri, 08 Apr 2022 14:49:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <arnd@arndb.de>) id 1ncpvw-0001yc-DW
 for kgdb-bugreport@lists.sourceforge.net; Fri, 08 Apr 2022 14:49:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ffn6CNagiox3914qFBNhJARYvQwA0h+EXT5LUs4fSRk=; b=c9XiBRwVPeiExX3l6LjjWYpnTt
 i14NKbovNKcE+dhn1+qGBuVAlu3CxqunjGFhhtoOqtRmlqToCDHgpp9qUzRbRb4JvInU+0kshDiab
 9Vvr6zzXahZWvVhCJq3qaZrBBaIHpgTnrb8HHlG+9yNHi5Gw6EbjyzowJOpipF7UmpKQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ffn6CNagiox3914qFBNhJARYvQwA0h+EXT5LUs4fSRk=; b=Qu9GUhaMb6IE+W+/xw0vF4+S3/
 GqlOwqBmzGRV8T34Vg5IDKdt7hhVMFjd2HC9B5p44kKuY8wfzwi4+2tIf9NAymXtKwVQJBEfeh/eP
 5/rnm17V7qh5IiPFYHwiqTAhbYXrjAYTsK4z9Um0Quqy4RfiFioFwvN9TbVLO8bsFaAk=;
Received: from mout.kundenserver.de ([212.227.126.134])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ncpvv-009r8Q-7J
 for kgdb-bugreport@lists.sourceforge.net; Fri, 08 Apr 2022 14:49:57 +0000
Received: from mail-wr1-f44.google.com ([209.85.221.44]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N1Oo7-1o6Lod1Ohf-012nYB for <kgdb-bugreport@lists.sourceforge.net>; Fri, 08
 Apr 2022 16:49:48 +0200
Received: by mail-wr1-f44.google.com with SMTP id u3so13245759wrg.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 08 Apr 2022 07:49:48 -0700 (PDT)
X-Gm-Message-State: AOAM530PCp9VC9HR4ddP1NMS5D84O+3fuKLMWombP49LYLc0/iWX/cFF
 evWJZKgJFWSsa48W2Z5DHN5Elfutj2P6N/zV74I=
X-Google-Smtp-Source: ABdhPJwVNzAUvp4q5y9Xv8Pl9NcevPGw56Av/8fDlBAo0sYujt7tAUw/HOtRrfZixqKYu184m37g27gifqdWtdVR4Vc=
X-Received: by 2002:a05:6000:178c:b0:204:648:b4c4 with SMTP id
 e12-20020a056000178c00b002040648b4c4mr14628640wrg.219.1649429387994; Fri, 08
 Apr 2022 07:49:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220331092235.3000787-1-hasegawa-hitomi@fujitsu.com>
 <20220331092235.3000787-2-hasegawa-hitomi@fujitsu.com>
 <YkWVTEG5oFO82GPL@kroah.com>
 <CAK8P3a0jnzse4sG58taO5+Yd5vCgh1uddqbtAuim_z9r15Q3BA@mail.gmail.com>
 <20220408133246.fyw5554lgli4olvg@maple.lan>
 <CAK8P3a0u2xa9BFmakG+f4kyLsqNZQbE6KQ6jz2356Fyen=1EHw@mail.gmail.com>
 <YlBE6hZHmLo9/wrU@kroah.com>
In-Reply-To: <YlBE6hZHmLo9/wrU@kroah.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 8 Apr 2022 16:49:31 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3v4+AO5avGoxeZSyNTOWqk8YS95xQLWSBZ=yV_3DKggg@mail.gmail.com>
Message-ID: <CAK8P3a3v4+AO5avGoxeZSyNTOWqk8YS95xQLWSBZ=yV_3DKggg@mail.gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
X-Provags-ID: V03:K1:h5ND/chknQzGIgiqMQ8P6ckhZqGh5X4mKkSDmR8mO6CR4f9fyXc
 wgGdWKUHi28/vKsVU1YvQ3qq/pG97F66r0a366oqdqq1cCTukeJCArf7Kr9SuSPzMdy0Xtv
 Pa9/vTWUWPA26oPwcskD2rssRLuVm7oHubtJa/Xfvi9v7mSUhz4J+6BKxovlro3KzlghFSH
 s1gbp3/W6FsN2i+cttCHg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ibhfRYLq0Ik=:lldlXffAYQaESC9Q4AypJA
 jb+DPPHlX34JzWifHVG/MsdaUL++Z5V2HCV1aD4jVN6CYAs5UbE84mQq7uVwyUsuGRqfEUN02
 sO1ayTiAAxkZea0VgDfM5cTXunAHAs4aOXutjjcyb9pG69SUgv4YVSmdnn9SZaIpj31a+Pd1t
 jWHaa93nZAY3wshBeS7XA5ISvKfF2w2HtBCOgBgfnL1qg1d/0aZUXZ4C0ggLNdxwYWnZ5dSZj
 apxwVWPV/KBjE+QoI6xyoS8Rr33nzLuVSY1w3Pk3fuHWuWjn6qmazc8wQWcKiVVQ1sItvQD3P
 +f+9QKp6dPwcIWrgGygJHcEh80wvLpOMilcf/aWnD3OZ+bm6bcjNM2+6EDT4OXXqvzPELA8ZZ
 YPhoZmSbHbhYqfsQucYh9vmYR4fo4cvV0UoMo00ZFl0wTp8YJ3HMVNnGKYsd60nJvibHeMS5T
 q0m4UeTHO3SaQbd0i1EEInzv05ICY2TZfvLKOEMgO1AX4nM3JyqtGBRKb554oUbdiLgwWffay
 Fj659ki4MMg2HbhdRHeR9Y7ShYM9IHLc5hX4A5QDoJpv1EYE0byZHwGajT0qK27wjqZOQD7Ht
 cWWb2f3E2jl/Uv2AEQE54otrD3xM0RTsUj+TBMx8MbVStLVDAGTJWoHFKVOWt6bSR7l0MdslF
 z0p49gZg4Ber06w00eYVEdTgMoRGaNpSBbR+dqMO78zOBQ4MVqlnQKtPmmCjCUhz8JbW1gYF5
 IFU4pkAPOJ9Dzau87tA1V43hTQfinN/+WzmP050T6qFw+HJ4xMmQZEVrK/rGR2tb+ndtPXhQv
 ucs4PotpkzR+jJZAjcmNuS1huZwqKdTMfDMHh1TZ4y/E/b4KXM=
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Apr 8,
 2022 at 4:21 PM Greg KH <gregkh@linuxfoundation.org>
 wrote: > > On Fri, Apr 08, 2022 at 04:17:16PM +0200, Arnd Bergmann wrote:
 > > On Fri, Apr 8, 2022 at 3:32 PM Daniel Thompson > > <da [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [212.227.126.134 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [212.227.126.134 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ncpvv-009r8Q-7J
Subject: Re: [Kgdb-bugreport] [PATCH v3 1/1] soc: fujitsu: Add A64FX
 diagnostic interrupt driver
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
Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
 Daniel Thompson <daniel.thompson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 kgdb-bugreport@lists.sourceforge.net,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mike Travis <mike.travis@hpe.com>, SoC Team <soc@kernel.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Jason Wessel <jason.wessel@windriver.com>, Olof Johansson <olof@lixom.net>,
 Jiri Slaby <jirislaby@kernel.org>, Will Deacon <will@kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

On Fri, Apr 8, 2022 at 4:21 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Fri, Apr 08, 2022 at 04:17:16PM +0200, Arnd Bergmann wrote:
> > On Fri, Apr 8, 2022 at 3:32 PM Daniel Thompson
> > <daniel.thompson@linaro.org> wrote:
> > > On Thu, Mar 31, 2022 at 05:44:55PM +0200, Arnd Bergmann wrote:
> > >
> > > There is some prior art for this sort of feature. AFAICT SGI UV has a
> > > similar mechanism that can send an NMI-with-no-side-channel to the
> > > kernel. The corresponding driver offers a range of actions using a
> > > module parameter:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/x86/platform/uv/uv_nmi.c#n180
> > >
> > > I don't think a hardcoded 'c' makes any sense. With a hardcoded argument
> > > it is just obfuscation. However it is certainly seems attractive to be
> > > able to reuse handle_sysrq() to provide a more powerful set of actions.
> >
> > How about a module parameter that allows picking a sysrq character then?
>
> Module parameters are so 1990, as this is a platform device, why not get
> it from DT?

This machine doesn't use DT. I suppose the same could be done with an EFI
variable, but with a module parameter you get the added benefit of having both
a boot time kernel command line argument, and the option to override it at
run time.

         Arnd


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
