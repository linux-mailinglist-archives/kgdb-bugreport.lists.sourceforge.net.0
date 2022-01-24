Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E208949A0DA
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 25 Jan 2022 00:31:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nC8oY-0002wu-I3
	for lists+kgdb-bugreport@lfdr.de; Mon, 24 Jan 2022 23:31:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <dianders@chromium.org>) id 1nC8oW-0002wk-IW
 for kgdb-bugreport@lists.sourceforge.net; Mon, 24 Jan 2022 23:31:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bwyi05nr6wT2ZFWR22PTFFEqIa15MbmZhLkPDJsvpx0=; b=Cl5gtnAGiPQ8rBBL02g0Z/Kjfb
 t3w8FbHCxEEkL8jxGmMiPh0GmpcKK2C+ksYrBjAQcW9rNjb2nc15cONLeakBh2oUfyG+wyACBN77M
 DbZH/Fn+RUmCthop9EhtpgSakJljDH1mqtSmLTBKN/g/Rcsm60ibEyyga4WvwTtPb12E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Bwyi05nr6wT2ZFWR22PTFFEqIa15MbmZhLkPDJsvpx0=; b=UPfqCb15WLI4NiXTI1sqFWHcsE
 dNwu74zZrzPp9YW8JK8R98OWKt2rkOAaapxvjY3tYpuDuUiltmvTL7WGxNWny8xLj66DY9VEMF7dm
 y+N7veM+3JHnfVVOsFSKhEu3C1F2szAAEbAyzLMtAFqiGs0CMbEk7qGiiiCOaw8I17gQ=;
Received: from mail-io1-f45.google.com ([209.85.166.45])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1nC8oT-0003Y4-Ir
 for kgdb-bugreport@lists.sourceforge.net; Mon, 24 Jan 2022 23:31:55 +0000
Received: by mail-io1-f45.google.com with SMTP id h7so3653481iof.3
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 24 Jan 2022 15:31:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Bwyi05nr6wT2ZFWR22PTFFEqIa15MbmZhLkPDJsvpx0=;
 b=RHC6VLVvqaubbaCRsVngcmpEX70I5qMnda30/M7WCCZwC5f0cqpQ3RymomMsBkULmw
 nf5/S3hSqeRVgjITKXpsUWSCPJ1zSs0WErq91oJeo4EwKAl5NWPxbZD95UmjUoLTZfxV
 UKqLgKCXjmYxAMpQTBGbu1bs6koOmgR3YMUPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Bwyi05nr6wT2ZFWR22PTFFEqIa15MbmZhLkPDJsvpx0=;
 b=MAbOvpjIHHrorbue36tYRvisDqL8X/0qfNd1wvkqiiUmYT7Qz+9dnF3r3ODdFIbHaj
 O0EtOR8kuqmaoeB7LuPLRSODJJ0fFgwrGQLgZU+AKcf11SFgpQqSKlTVgGiAev++2d66
 Cz+9gF11lTiKNb+h9pfUBEmFTMMXPIcidvxZlu6tLgXO38xUc6C+EFxrijWFpLPjqLke
 JPewNM06QcGjBURzTQQ2lE1bdMO39yy4PuefmyfkUvXrzpBf2AuM3IE46HGCPv9+78Hb
 8DbQcbHAKmSixhk5GtQe7d1jjrF3bmilElQwejc+kfg6Kh/7JCO5vewc9S4uZgCUWunT
 XNCA==
X-Gm-Message-State: AOAM531ROmMdC77bTBdVphs81FcRp3SenD5CfTq8kBU21KH2FT+Ro1Sb
 M/VNIGO/rpLI7Lkii3H1a9C+TItzy8mxTA==
X-Google-Smtp-Source: ABdhPJx24tXJjCVpm+itsDs5CziOkZo+ZsE95PLnwqZIAKM9UVL6wXkXGqGEggLuYDZyxNpUOKLOxQ==
X-Received: by 2002:a05:6e02:1529:: with SMTP id
 i9mr9712998ilu.149.1643060600146; 
 Mon, 24 Jan 2022 13:43:20 -0800 (PST)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com.
 [209.85.166.43])
 by smtp.gmail.com with ESMTPSA id a2sm640960ilj.35.2022.01.24.13.43.17
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jan 2022 13:43:18 -0800 (PST)
Received: by mail-io1-f43.google.com with SMTP id n17so5427429iod.4
 for <kgdb-bugreport@lists.sourceforge.net>;
 Mon, 24 Jan 2022 13:43:17 -0800 (PST)
X-Received: by 2002:a02:9043:: with SMTP id y3mr7723156jaf.263.1643060597485; 
 Mon, 24 Jan 2022 13:43:17 -0800 (PST)
MIME-Version: 1.0
References: <cover.1643015752.git.christophe.leroy@csgroup.eu>
 <848d857871f457f4df37e80fad468d615b237c24.1643015752.git.christophe.leroy@csgroup.eu>
In-Reply-To: <848d857871f457f4df37e80fad468d615b237c24.1643015752.git.christophe.leroy@csgroup.eu>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Jan 2022 13:43:06 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VMUA+8RFOSkVQTmBDrHPSYSG5VBVA_EKKQuBjF0ZZKpQ@mail.gmail.com>
Message-ID: <CAD=FV=VMUA+8RFOSkVQTmBDrHPSYSG5VBVA_EKKQuBjF0ZZKpQ@mail.gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Mon, Jan 24,
 2022 at 1:22 AM Christophe Leroy <christophe.leroy@csgroup.eu>
 wrote: > > --- a/kernel/debug/kdb/kdb_main.c > +++
 b/kernel/debug/kdb/kdb_main.c
 > @@ -2022,8 +2022,11 @@ static int kdb_ [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.45 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.45 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nC8oT-0003Y4-Ir
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

Hi,

On Mon, Jan 24, 2022 at 1:22 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> --- a/kernel/debug/kdb/kdb_main.c
> +++ b/kernel/debug/kdb/kdb_main.c
> @@ -2022,8 +2022,11 @@ static int kdb_lsmod(int argc, const char **argv)
>                 if (mod->state == MODULE_STATE_UNFORMED)
>                         continue;
>
> -               kdb_printf("%-20s%8u  0x%px ", mod->name,
> -                          mod->core_layout.size, (void *)mod);
> +               kdb_printf("%-20s%8u", mod->name, mod->core_layout.size);
> +#ifdef CONFIG_ARCH_WANTS_MODULES_DATA_IN_VMALLOC
> +               kdb_printf("/%8u  0x%px ", mod->data_layout.size);

Just counting percentages and arguments, it seems like something's
wrong in the above print statement.

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
