Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6D9912851
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 21 Jun 2024 16:47:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1sKfXh-0004Ry-2Q
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 21 Jun 2024 14:47:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1sKfXc-0004Ro-UM
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 21 Jun 2024 14:47:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DBkwuvx+qzIcwOnXOSKtVB4mU9IrbBnzcqFsSbdvXpo=; b=gW6hPqbIBjeNoQC8d7hTs7n0oj
 qXI4FyvEjL6d89qFXOTbcwblmyM+g50XvMHY+So1R6bsJdoNcFCQZqFaLO+WfToLL0B6w08VG+xl9
 xKh09tnf82jW4EwUCLxncl2CLLb37Zu1d7+IJA9HxSTJS43mj7KLtMauERde+06pTlEU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DBkwuvx+qzIcwOnXOSKtVB4mU9IrbBnzcqFsSbdvXpo=; b=IJxX9x5Y7xtbQjXOfYnbepIvTS
 vyV4R6UrzK4KtWwcnCperFYDulqbFc5JXbjX+1JzZ+k91iVR3fQHALG/tbvFXUsxePm3xV4FoZOOE
 gPVD3Ym1jMxQyUWwJkmzcXEN2TE26eP4xJtNpAjOXi3DmsrTdrXzEldiUTbyCRxAGibs=;
Received: from mail-wr1-f46.google.com ([209.85.221.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sKfXd-00012h-7O for kgdb-bugreport@lists.sourceforge.net;
 Fri, 21 Jun 2024 14:47:05 +0000
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3629c517da9so2139510f8f.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 21 Jun 2024 07:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718981213; x=1719586013; darn=lists.sourceforge.net;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DBkwuvx+qzIcwOnXOSKtVB4mU9IrbBnzcqFsSbdvXpo=;
 b=ivxEtqZyeq0BEDctiQAuvEzoYUJPfF2VWS69NXwFcoSdBlWZiGBD+RVkyo1dg/x2En
 JBqkgvgmhtRlLY8a+daPh+3UiaNHAqJHdfAw2Q6A3M7SaZtBEWgYcjtBuhe2Mk5cE02g
 0+Z5yph0VYVmT9Va2peXUHEHCqBo3Hcr7Q/p+AXELcCUC0DxRCwfRa43Op0MYJ2mlO11
 Y9Y/NjzKqeGcQmdFnGPEa/vwXFBXEzdZFqdi+kc7er8UR6ALEPxlAZnDsiHa5ISPoVlJ
 T4Vxk7gwB/MDhg23OK3fL0w8nqzZ4tzaF0bZUWVmgYnsHwfnBmyX4mic+jDJm4W37Ojj
 FoSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718981213; x=1719586013;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DBkwuvx+qzIcwOnXOSKtVB4mU9IrbBnzcqFsSbdvXpo=;
 b=QJ2Vt45bjcXNSlf2ArermRhPFJgr9j/70rveWaNxMyWJfsh66RBtnXB931Z2dAb0BH
 uo3B+OaVU0X6sgGAoUhvQxMNKf1annk7jLprxyolLhivY3Opn4zGVG03rnOMtYE+ogAN
 LZ+sYdKxmoPH1RqhN/lW2IDI4H5AhAwe/q/+QEtreM0xkMc3q5AwlnuvsxVTaqBYLphN
 hSuz10EKHrNYBLoFp271Z03rAHcWRFbKsscLEClw6AundOHKSiP443j2VVv63Xux6iDG
 NrJlU+hzlJTOPxW2ODfRt1mxhUMUr6eONjZ9oUyl8iI0dbUaZ3xfbwAH26WcXglqHqud
 61xA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU7t1cRo6rtBs4cf9t5n59O0O8hnFSUbRip7mHi9dTz7ClrOZOqjqSY7x6JUhqjrJSqZkasuZ8dvuYEsiL/R4mcO/liFNkSPCAPikng+07znbnMUSM=
X-Gm-Message-State: AOJu0YwZ0QyaEPSU73GQmQeUdBTd0ur3BEXfQ2qUCrl2C3vb3WwK3rXM
 /CBjTR3gpRSIQmGoHkPHHrBG8408Eqo51NTf8xDryKh7bWxTwLVPK7Kw+C1ny5Y=
X-Google-Smtp-Source: AGHT+IFuaYVvQQ5U+lob8+mammMMATTKb0eN6b3Bkn7maKlnKEA90KDPdKc5TSvOFx3y9exnTmabaw==
X-Received: by 2002:adf:fcca:0:b0:35f:2363:e4fc with SMTP id
 ffacd0b85a97d-363175b8fc2mr7663280f8f.17.1718981212841; 
 Fri, 21 Jun 2024 07:46:52 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4247d0b63d4sm67564025e9.3.2024.06.21.07.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jun 2024 07:46:52 -0700 (PDT)
Date: Fri, 21 Jun 2024 15:46:50 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20240621144650.GC285771@aspen.lan>
References: <20240620142132.157518-1-zhengzengkai@huawei.com>
 <CAD=FV=Uw4-czLekDJ1aU55Kxb5NeXVufnpo4fYy9EwQ-KUqDCQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=Uw4-czLekDJ1aU55Kxb5NeXVufnpo4fYy9EwQ-KUqDCQ@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Fri, Jun 21, 2024 at 07:36:49AM -0700, Doug Anderson wrote:
    > Hi, > > On Thu, Jun 20, 2024 at 6:58 AM Zheng Zengkai <zhengzengkai@huawei.com>
    wrote: > > > > Commit cf8e8658100d ("arch: Remove Ita [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
                             blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [URIs: linaro.org]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.46 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.221.46 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.221.46 listed in sa-accredit.habeas.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.46 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
X-Headers-End: 1sKfXd-00012h-7O
Subject: Re: [Kgdb-bugreport] [PATCH RESEND] kdb: Get rid of redundant
 kdb_curr_task()
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
Cc: pmladek@suse.com, Zheng Zengkai <zhengzengkai@huawei.com>,
 kgdb-bugreport@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 thorsten.blum@toblux.com, christophe.jaillet@wanadoo.fr,
 jason.wessel@windriver.com, yuran.pereira@hotmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gRnJpLCBKdW4gMjEsIDIwMjQgYXQgMDc6MzY6NDlBTSAtMDcwMCwgRG91ZyBBbmRlcnNvbiB3
cm90ZToKPiBIaSwKPgo+IE9uIFRodSwgSnVuIDIwLCAyMDI0IGF0IDY6NTjigK9BTSBaaGVuZyBa
ZW5na2FpIDx6aGVuZ3plbmdrYWlAaHVhd2VpLmNvbT4gd3JvdGU6Cj4gPgo+ID4gQ29tbWl0IGNm
OGU4NjU4MTAwZCAoImFyY2g6IFJlbW92ZSBJdGFuaXVtIChJQS02NCkgYXJjaGl0ZWN0dXJlIikK
PiA+IHJlbW92ZWQgdGhlIG9ubHkgZGVmaW5pdGlvbiBvZiBtYWNybyBfVElGX01DQV9JTklULCBz
byBrZGJfY3Vycl90YXNrKCkKPiA+IGlzIGFjdHVhbGx5IHRoZSBzYW1lIGFzIGN1cnJfdGFzaygp
IG5vdyBhbmQgYmVjb21lcyByZWR1bmRhbnQuCj4gPgo+ID4gTGV0J3MgcmVtb3ZlIHRoZSBkZWZp
bml0aW9uIG9mIGtkYl9jdXJyX3Rhc2soKSBhbmQgcmVwbGFjZSByZW1haW5pbmcKPiA+IGNhbGxz
IHdpdGggY3Vycl90YXNrKCkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWmhlbmcgWmVuZ2thaSA8
emhlbmd6ZW5na2FpQGh1YXdlaS5jb20+Cj4gPiAtLS0KPiA+ICBrZXJuZWwvZGVidWcva2RiL2tk
Yl9idC5jICAgICAgfCAgMiArLQo+ID4gIGtlcm5lbC9kZWJ1Zy9rZGIva2RiX21haW4uYyAgICB8
IDE4ICsrKystLS0tLS0tLS0tLS0tLQo+ID4gIGtlcm5lbC9kZWJ1Zy9rZGIva2RiX3ByaXZhdGUu
aCB8ICAyIC0tCj4gPiAgMyBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDE3IGRlbGV0
aW9ucygtKQo+Cj4gSW4gY2FzZSBEYW5pZWwgcGlja3MgdGhpcyBvbmUgdXAgc2luY2UgaXQgQ0Nz
IExLTUwsIEknbGwgY29weSBteSB0YWcKPiBmcm9tIHRoZSBvbmUgdGhhdCBkaWRuJ3Q6Cj4KPiBS
ZXZpZXdlZC1ieTogRG91Z2xhcyBBbmRlcnNvbiA8ZGlhbmRlcnNAY2hyb21pdW0ub3JnPgoKVGhh
bmtzIERvdWcuIEkgd2FzIGxpdGVyYWxseSBnZXR0aW5nIHRvIGl0IG5vdyEKCgpEYW5pZWwuCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KS2dkYi1idWdy
ZXBvcnQgbWFpbGluZyBsaXN0CktnZGItYnVncmVwb3J0QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9rZ2RiLWJ1Z3JlcG9y
dAo=
