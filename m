Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B04730DEE6
	for <lists+kgdb-bugreport@lfdr.de>; Wed,  3 Feb 2021 16:58:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1l7KXr-0006uj-IV
	for lists+kgdb-bugreport@lfdr.de; Wed, 03 Feb 2021 15:58:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dianders@chromium.org>) id 1l7KXp-0006uZ-Ry
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Feb 2021 15:58:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xywV9eMRMiWViCjiK4rzNmLwiq1zdJg8S+9jtfPFzMw=; b=KWzMVNE45yNPfALuuWqJ907QXO
 TTNQfA3We+Iu/9xgq9IqyJhVD9UkWEsMp+irL5Ouns6Pj4H9f4pzK5gT7BjzMv+1aWVot3ZXNhoJM
 RhpY7LqL95KC+3nGz9qp9ryXgiizAYqeBXwRymzkVX4ri2dR3wA/Ig85VTYF0rLxq7+8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xywV9eMRMiWViCjiK4rzNmLwiq1zdJg8S+9jtfPFzMw=; b=ESJGttbjKLJCal/NuFxQFIB7V7
 R/O2WMW6YHG4+xS1xf/QPIEYp7Ac5YjGyhDhy0o/fDMHfN8/4pMNBYmjetiBIbmuPafmSsJhYdiTJ
 S2l76iazdHMa6z5tdrgKwkybDXwGbjcdCAmGMRsI1E0GrXywZW4xPwrTYS0LyYOxcIK8=;
Received: from mail-qt1-f182.google.com ([209.85.160.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1l7KXc-0000lW-MU
 for kgdb-bugreport@lists.sourceforge.net; Wed, 03 Feb 2021 15:58:17 +0000
Received: by mail-qt1-f182.google.com with SMTP id n8so19521qtp.5
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 03 Feb 2021 07:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=xywV9eMRMiWViCjiK4rzNmLwiq1zdJg8S+9jtfPFzMw=;
 b=QAu01BkZL7yF73qfm2zuunwSuRnuzrhcX40XHeO4gvcNVjMyM8x0os3EVHymtyIpiW
 cvYkqO/4ZTu4fsQA63iTvbkcOl3p4pAD+mvE/l+heD/NBTBx7yu6surPVLHqqjejUwFw
 SEelkjNO8vUNVluvv1IagkMgPJUKrz6o7Xqbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xywV9eMRMiWViCjiK4rzNmLwiq1zdJg8S+9jtfPFzMw=;
 b=XrHTzg/HZ/ATbfGmp50M0FX2kqj0CzsUqKrRYqCODiYbxxl5xFq2odkxW5/clW453k
 +WLbJV0vB3+ejWAOe57K48PBZwdtSZ/lgxU+hLDIW/9px2ROzMcKk0Z/hAMuj+38zN8P
 kYtCh/w2XeBWISY2/xE63AwmSPF4QAtLMbDIakvnDddxwEpiO80OYUG8KgcJ0i5wjyoe
 +k7KzNaFgK5JsABWio7KLn2J44xQD6JRySd4gtlfP+1WkUoCAeVWsosDQfEpRGJlla1P
 uh95Be3mPf/5hEPxqWeQsIfQVbJZ0zHBGhlVTvU30RUgJsvsE//vpeVrSjGHJ3O/ttnd
 GMlQ==
X-Gm-Message-State: AOAM533pzlnRVWvA2uVNEcirmY30W4q2LWWj4UzF+mMdvnhCKayO+K+W
 G88uGK8v99TQAJr+eVpHpI1udPj61Fm2IA==
X-Google-Smtp-Source: ABdhPJy26Ly/LUk/H4aHH0SdwCmPv9aQK9FS37BhkiKAlvTs9sFB3ceCJJY7prRhie06Ell7CZnXQw==
X-Received: by 2002:a05:622a:216:: with SMTP id
 b22mr2974177qtx.163.1612367878514; 
 Wed, 03 Feb 2021 07:57:58 -0800 (PST)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com.
 [209.85.219.176])
 by smtp.gmail.com with ESMTPSA id q18sm1607579qtr.74.2021.02.03.07.57.57
 for <kgdb-bugreport@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 07:57:57 -0800 (PST)
Received: by mail-yb1-f176.google.com with SMTP id y128so21374ybf.10
 for <kgdb-bugreport@lists.sourceforge.net>;
 Wed, 03 Feb 2021 07:57:57 -0800 (PST)
X-Received: by 2002:a25:da53:: with SMTP id n80mr5263122ybf.79.1612367877243; 
 Wed, 03 Feb 2021 07:57:57 -0800 (PST)
MIME-Version: 1.0
References: <1612005840-4342-1-git-send-email-stephenzhangzsd@gmail.com>
 <CAD=FV=WQ7iCQFf6Qb3agM4DCt_Df3c6BwV_T6tEMMxXArbY_5A@mail.gmail.com>
 <CALuz2=erXGa2q_ODOpARK9yb_GQo0nOLWnP-PuBMCc+pv8Cp4Q@mail.gmail.com>
 <CAD=FV=Xcywabh3U0=hzd8DXR2gdwLBEFsbwLof7Y6LMu+ViPNA@mail.gmail.com>
 <CALuz2=cApyqB2FWvf8GVhAtGJrBGVWxTvQmiiOFUN+zouqZOUA@mail.gmail.com>
In-Reply-To: <CALuz2=cApyqB2FWvf8GVhAtGJrBGVWxTvQmiiOFUN+zouqZOUA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 3 Feb 2021 07:57:45 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Wfg4NOCioKA4OHuaKezGgusc38YgMQ9U6Zvo7dO=zY2w@mail.gmail.com>
Message-ID: <CAD=FV=Wfg4NOCioKA4OHuaKezGgusc38YgMQ9U6Zvo7dO=zY2w@mail.gmail.com>
To: Stephen Zhang <stephenzhangzsd@gmail.com>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: chromium.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.160.182 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.182 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1l7KXc-0000lW-MU
Subject: Re: [Kgdb-bugreport] [PATCH v3] kdb: kdb_support: Fix debugging
 information problem
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
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>, Jason Wessel <jason.wessel@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

SGksCgpPbiBXZWQsIEZlYiAzLCAyMDIxIGF0IDM6MzEgQU0gU3RlcGhlbiBaaGFuZyA8c3RlcGhl
bnpoYW5nenNkQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBEb3VnIEFuZGVyc29uIDxkaWFuZGVyc0Bj
aHJvbWl1bS5vcmc+IOS6jjIwMjHlubQy5pyIM+aXpeWRqOS4iSDkuIrljYgxOjQw5YaZ6YGT77ya
Cj4+Cj4+IDx0YWI+a2RiX2RiZ19wcmludGYoQVIsICJyZXR1cm5zIFsuLi5dICglcylcbiIsCj4+
IDx0YWI+PHRhYj4gICAgICAgcmV0LCBzeW10YWItPnN5bV9zdGFydCwgWy4uLl0sIHN5bXRhYi0+
c3ltX25hbWUpOwo+Cj4KPiBUaGFuayB5b3UgZm9yIHRoZSBkZXRhaWxlZCBleHBsYW5hdGlvbi4g
SW4gdGhpcyBjYXNlLCBTaG91bGRuJ3QgdGhlICJyZXQiICBiZSB1bmRlcgo+IHRoZSAiKEFSIj8g
bGlrZSBiZWxvdzoKPgo+IDx0YWI+a2RiX2RiZ19wcmludGYoQVIsICJyZXR1cm5zIFsuLi5dICgl
cylcbiIsCj4gPHRhYj48dGFiPiAgICAgICAgICAgICAgIHJldCwgc3ltdGFiLT5zeW1fc3RhcnQs
IFsuLi5dLCBzeW10YWItPnN5bV9uYW1lKTsKPgo+ICBTZWUKPiA8aHR0cHM6Ly93d3cua2VybmVs
Lm9yZy9kb2MvaHRtbC92NS4xMC9wcm9jZXNzL2NvZGluZy1zdHlsZS5odG1sI2JyZWFraW5nLWxv
bmctbGluZXMtYW5kLXN0cmluZ3M+Cj4gd2hlcmUgaXQgc2F5cyAiQSB2ZXJ5IGNvbW1vbmx5IHVz
ZWQgc3R5bGUgaXMgdG8gYWxpZ24gZGVzY2VuZGFudHMgdG8gYSBmdW5jdGlvbiBvcGVuIHBhcmVu
dGhlc2lzIi4KPiBUaGUgImRlc2NlbmRhbnRzIiBoZXJlIG1lYW5zIHRoZSBuZXh0IGxpbmUsIHJp
Z2h0PwoKWWVzLCAiZGVzY2VuZGFudHMiIG1lYW5zIHRoZSBuZXh0IGxpbmUuCgpJIGhhdmUgYSBn
dWVzcyBhYm91dCB3aGF0IHlvdXIgcHJvYmxlbSBpcy4gIEluIGtlcm5lbCBsYW5kLCB0YWJzIGFy
ZSA4CnNwYWNlcywgbm90IDQuICBBbHNvIG1ha2Ugc3VyZSB5b3VyIGVkaXRvciBpcyB1c2luZyBh
IGZpeGVkLXdpZHRoCmZvbnQuICBJbiBnbWFpbCBteSBleGFtcGxlIG1pZ2h0IG5vdCBsb29rIGxp
a2UgaXQncyBsaW5pbmcgdXAsIGJ1dAp3aGVuIHlvdSBnbyBpbnRvIHRoZSBlZGl0b3IgaXQgc2hv
dWxkLgoKLURvdWcKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpLZ2RiLWJ1Z3JlcG9ydCBtYWlsaW5nIGxpc3QKS2dkYi1idWdyZXBvcnRAbGlzdHMuc291
cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZv
L2tnZGItYnVncmVwb3J0Cg==
