Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DF144C01F9
	for <lists+kgdb-bugreport@lfdr.de>; Tue, 22 Feb 2022 20:24:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1nMam9-0002wZ-F7
	for lists+kgdb-bugreport@lfdr.de; Tue, 22 Feb 2022 19:24:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <dianders@chromium.org>) id 1nMam7-0002wT-Sx
 for kgdb-bugreport@lists.sourceforge.net; Tue, 22 Feb 2022 19:24:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5GmqNRhB5+LoDYStD2USYSV7vOo4JH447IACLApzM7c=; b=Nsy7s3JxbSRehE4B9BDuEUVQ43
 eJc/+EHgwTtr7cOkEjzriyvxMq/Mcm3sOl94v8R+v9QqfHRdb32jf1YlR4pIGP+v5j3Jk/0yIcFYT
 dP/tDsIDEXmlAH/kjWIwYmBsPWE1k0eYmUNxrHp5d5xebYdYLZxIHGVg+Puh/T97eigs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
 MIME-Version:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5GmqNRhB5+LoDYStD2USYSV7vOo4JH447IACLApzM7c=; b=E9lKyxCiSwFdhpVVASI1G8YBR1
 LPIA08woGpHa7t1Y3EwuqTAWz+PzKD+gbGZJM3oHnTSWfnKMeAwHsRUteBrWjbe2D0e87RA1LRs8/
 7DqosRxVfymkYApnjOnD5CPMz23YRVtjhu/6R7LyXgMv/l5D+3FxWl0kTBoRFsnxpcw4=;
Received: from mail-lf1-f50.google.com ([209.85.167.50])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.94.2)
 id 1nMam4-00BdAI-OW
 for kgdb-bugreport@lists.sourceforge.net; Tue, 22 Feb 2022 19:24:38 +0000
Received: by mail-lf1-f50.google.com with SMTP id b11so26801054lfb.12
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 22 Feb 2022 11:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5GmqNRhB5+LoDYStD2USYSV7vOo4JH447IACLApzM7c=;
 b=Sbly6JGaY7NCcVthClEqBSWBwk0y42HITnHQxM5X99XUqJLtNhRhPxGXmzjx5dI8Lu
 eA8AsrHoaav4XUoLSVHKpGp5HSKssiC3fDEeuMY9w3550lCtPJjVQgvxgt1KmcGPMrVZ
 BEryE/mhgv8nHjqnPERZKL+GPMLInsJy37/ao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5GmqNRhB5+LoDYStD2USYSV7vOo4JH447IACLApzM7c=;
 b=KdRi7XQcrel3h8MUrUk+qvSeG+1CR9bfJEbfL52xciN9ykCL9TBRRbcOGuo6yzO5z7
 PmTz8kyLYh6EnkCJkb1BHu/Ca954sTHRBBAELmEdkor+xV2IPIC2kki1S2n44e7qB98/
 ioDH2I7aZsGu255rhDlJd61cMfiMvaMZC85CPwVCHxzNTO4KbYcHXfQnIlCcdjSi6VEN
 MJgxYiIRdnjjkullj5GdfIHP1cEVNXs1isXX4VmFUlwj0T4kzhv/i3SGyWy/XyYILp6c
 xfLdrFRV1NCPRV3HDYPjZtHqHk+cex1CL32H+jexT6hFLeuBDtfcBHFG6IV7V9ddZ1Pt
 pN6g==
X-Gm-Message-State: AOAM533zr84N1Yka+/qSpWo1QkaAdOSx6ibwZNvbOwSgKuO46IkXSNl/
 Xu51Mm+9+tbVzMCvhc9+q/0x4pZVdCiiamJ4
X-Google-Smtp-Source: ABdhPJxX+JxfaTx7yscgjSe9dgaFP4w4fkuJDM13uEFs22QUY9DE1noL2mxy2y+zZzIp2W/hSrfkfg==
X-Received: by 2002:a50:f686:0:b0:410:e352:e61a with SMTP id
 d6-20020a50f686000000b00410e352e61amr26791385edn.23.1645551041380; 
 Tue, 22 Feb 2022 09:30:41 -0800 (PST)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com.
 [209.85.221.44])
 by smtp.gmail.com with ESMTPSA id 27sm6470203eji.66.2022.02.22.09.30.40
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Feb 2022 09:30:40 -0800 (PST)
Received: by mail-wr1-f44.google.com with SMTP id s13so6234546wrb.6
 for <kgdb-bugreport@lists.sourceforge.net>;
 Tue, 22 Feb 2022 09:30:40 -0800 (PST)
X-Received: by 2002:a5d:64ea:0:b0:1ea:8148:6b97 with SMTP id
 g10-20020a5d64ea000000b001ea81486b97mr4061063wri.679.1645551040170; Tue, 22
 Feb 2022 09:30:40 -0800 (PST)
MIME-Version: 1.0
References: <20220221061954.4822-1-tangmeng@uniontech.com>
In-Reply-To: <20220221061954.4822-1-tangmeng@uniontech.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 22 Feb 2022 09:30:27 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UN0fCc4TnUj_+sHX5ap9JkBBVR+pTzV8vssZDxfao9Hw@mail.gmail.com>
Message-ID: <CAD=FV=UN0fCc4TnUj_+sHX5ap9JkBBVR+pTzV8vssZDxfao9Hw@mail.gmail.com>
To: tangmeng <tangmeng@uniontech.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, On Sun, Feb 20,
 2022 at 10:20 PM tangmeng <tangmeng@uniontech.com>
 wrote: > > In kernel/Makefile has: > obj-$(CONFIG_KGDB) += debug/ > > so
 kernel/debug/Makefile don't need this 'obj-$(CONFIG_KGDB) += [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.50 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.50 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nMam4-00BdAI-OW
Subject: Re: [Kgdb-bugreport] [PATCH] kernel/debug: remove unnecessary
 CONFIG options
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

On Sun, Feb 20, 2022 at 10:20 PM tangmeng <tangmeng@uniontech.com> wrote:
>
> In kernel/Makefile has:
> obj-$(CONFIG_KGDB) += debug/
>
> so kernel/debug/Makefile don't need this 'obj-$(CONFIG_KGDB) +=',
> delete it from kernel/debug/Makefile.
>
> Signed-off-by: tangmeng <tangmeng@uniontech.com>
> ---
>  kernel/debug/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Seems fine to me, with the nit that your Signed-off-by is supposed to
have your "real name", not your username. See
`Documentation/process/submitting-patches.rst`. Some maintainers will
let this slide, but if you're going to submit a patch fixing a nitty
issue then it seems fair to get called out on nits. ;-)

-Doug


_______________________________________________
Kgdb-bugreport mailing list
Kgdb-bugreport@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/kgdb-bugreport
