Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 902FA300C1F
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 22 Jan 2021 20:13:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l31sX-0006H3-B8
	for lists+kgdb-bugreport@lfdr.de; Fri, 22 Jan 2021 19:13:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1l31sV-0006Gr-8K
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 Jan 2021 19:13:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mQ94cMMY2wJZ02bDEQhrKD3tBdrmXB7f97ooLXkrbTQ=; b=A2qOSmD3xlDMIdE1+QBSKx4v73
 YmtyKNDJwEhGhnY5iyzuU/Cr8eSf9rxhsUVLzbR1PxxcHkQkUrFMar5HdPiei49tezZAuNF6PQfzU
 BFWNLTuEY0K66nhXBKZGokczkw6QQ4ODajUL6E7p74gpfLS8kTCd66mDDXSWf2Zn7Jdo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mQ94cMMY2wJZ02bDEQhrKD3tBdrmXB7f97ooLXkrbTQ=; b=CMJ9Jv9k8lD+o1nEiXwB1ZjSfB
 G6FC1bnlBt0HR2wIKczSIFRs75jADUiFcPoiIixjhHlCLcvVmvUAtCCwyzXAlJyU1sh98Bb15LRly
 jG/+RvSnuN2pGIrfUX2nF6QmwFYH4fZZ/C+Es991qyxTHE7gj7HD+52Z2cWHoQ9Wp4G4=;
Received: from mail-vs1-f48.google.com ([209.85.217.48])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1l31sM-00BDS1-A2
 for kgdb-bugreport@lists.sourceforge.net; Fri, 22 Jan 2021 19:13:51 +0000
Received: by mail-vs1-f48.google.com with SMTP id 186so3590844vsz.13
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 22 Jan 2021 11:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mQ94cMMY2wJZ02bDEQhrKD3tBdrmXB7f97ooLXkrbTQ=;
 b=N5L2BsJ1QX6yeiIPK7tfQrlbUtQn8fcirbI6nPvVuK5UXrTQInFZGO6puP/YKNEIGg
 H9iokwBGet1zvFEv/30JOid2vxMO3vGorJvn1lsoktepiDjBvBu8PGIhTPY97HF+nMGw
 5OB9aiGZkPFuuvGasRsjibKN8dGMdIU3rmVVI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mQ94cMMY2wJZ02bDEQhrKD3tBdrmXB7f97ooLXkrbTQ=;
 b=gMgEnweUOV99tfx5E9KmJk1h+3zp7axkGpki+k+lDTjX+niiLLY5HthhH5TmlOopDe
 UM6L3CEQF4Ug/ISoSM3CWdpfufQEk/sWBHJDd27/Wz6gGMBApsC9SGbQ4odk4UVeavX/
 FXHV+hNxq+bkQMg20gGsDG+arnRfNlv2+RQujcxdQB+MkLjslQVss2u4e/UfBG6OgVPU
 5OqAgIfH681WU1QH0Bwq65S4mIGcmzNmSdI1YTL3MWZYXgg9SXQyZtCDEiY7TwzYAMxq
 Til+ejrjh5Nl9DgQHf8vycp4yzgIerQ0jIzDaRXAtSudJGGzlse1g1F5+WuuXAqeGort
 WBag==
X-Gm-Message-State: AOAM530VgrvoMIAWf505Pkx8l4NfNPbmTJdb3ZnsveI7FcYt/Km31LKC
 HtbRbpNSm/tAJAMFB1HFZLsFHWXGlZoXBw==
X-Google-Smtp-Source: ABdhPJyxjRJIM47DbOYfAV/ARQrL0BmRU9go/elDXNYb3GI87gUrDcrGoOaCwqgn9OR/wUUJtJ97Jw==
X-Received: by 2002:a67:1dc4:: with SMTP id d187mr581938vsd.53.1611340971877; 
 Fri, 22 Jan 2021 10:42:51 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com.
 [209.85.217.48])
 by smtp.gmail.com with ESMTPSA id z18sm1336361vkd.13.2021.01.22.10.42.50
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 10:42:51 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id f22so3555131vsk.11
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 22 Jan 2021 10:42:50 -0800 (PST)
X-Received: by 2002:a05:6102:109:: with SMTP id
 z9mr1614866vsq.34.1611340970333; 
 Fri, 22 Jan 2021 10:42:50 -0800 (PST)
MIME-Version: 1.0
References: <1611053418-29283-1-git-send-email-sumit.garg@linaro.org>
In-Reply-To: <1611053418-29283-1-git-send-email-sumit.garg@linaro.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 22 Jan 2021 10:42:38 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Vrf4v0DKfZ7BAjW3ODoYeuwDu8L0S1kOMbbG+=WiVOnQ@mail.gmail.com>
Message-ID: <CAD=FV=Vrf4v0DKfZ7BAjW3ODoYeuwDu8L0S1kOMbbG+=WiVOnQ@mail.gmail.com>
To: Sumit Garg <sumit.garg@linaro.org>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: linaro.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.217.48 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.217.48 listed in list.dnswl.org]
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l31sM-00BDS1-A2
Subject: Re: [Kgdb-bugreport] [PATCH] kdb: Simplify kdb commands registration
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
Cc: kgdb-bugreport@lists.sourceforge.net,
 Daniel Thompson <daniel.thompson@linaro.org>,
 LKML <linux-kernel@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

Hi,

On Tue, Jan 19, 2021 at 2:50 AM Sumit Garg <sumit.garg@linaro.org> wrote:
>
> Simplify kdb commands registration via using linked list instead of
> static array for commands storage.
>
> Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
> ---
>  kernel/debug/kdb/kdb_main.c    | 78 ++++++++++--------------------------------
>  kernel/debug/kdb/kdb_private.h |  1 +
>  2 files changed, 20 insertions(+), 59 deletions(-)

Wow, nice.  It should have been done this way from the start!  ;-)


> @@ -1011,7 +1005,7 @@ int kdb_parse(const char *cmdstr)
>                 ++argv[0];
>         }
>
> -       for_each_kdbcmd(tp, i) {
> +       list_for_each_entry(tp, &kdb_cmds_head, list_node) {
>                 if (tp->cmd_name) {

So I think here (and elsewhere in this file) you can remove this "if
(...->cmd_name)" stuff now, right?  That was all there because the old
"remove" used to just NULL out the name to handle gaps and that's no
longer possible.  If you are really paranoid you could error-check
kdb_register_flags()


> --- a/kernel/debug/kdb/kdb_private.h
> +++ b/kernel/debug/kdb/kdb_private.h
> @@ -174,6 +174,7 @@ typedef struct _kdbtab {
>         short    cmd_minlen;            /* Minimum legal # command
>                                          * chars required */
>         kdb_cmdflags_t cmd_flags;       /* Command behaviour flags */
> +       struct list_head list_node;

nit: every other entry in this struct has a comment but not yours..


Other than those small nits I think this is a great improvement, thanks!

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
