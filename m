Return-Path: <kgdb-bugreport-bounces@lists.sourceforge.net>
X-Original-To: lists+kgdb-bugreport@lfdr.de
Delivered-To: lists+kgdb-bugreport@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4569CE213
	for <lists+kgdb-bugreport@lfdr.de>; Fri, 15 Nov 2024 15:49:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <kgdb-bugreport-bounces@lists.sourceforge.net>)
	id 1tBxdu-0007Jg-J3
	for lists+kgdb-bugreport@lfdr.de;
	Fri, 15 Nov 2024 14:49:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daniel.thompson@linaro.org>) id 1tBxds-0007JR-UQ
 for kgdb-bugreport@lists.sourceforge.net;
 Fri, 15 Nov 2024 14:49:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1CQ3VJsQiO7mOfIPbHAPwesm3SB/ITY8Xq3kn4cE8Tw=; b=RcnGHyScwND+SuXeu5WVT7JrpN
 Mh/WQqpG92njEltCamfmhIdL35eQ1CQDWi/c+v27TOpGQSHCFk0Ji2qSGKWdDGgnX1ss1CtRNPdxi
 dB6/YWMJwmIFoVzTUlPqiyhtfFNDXtbaM62IBP8zb0OajwsAA0ooNNM0vaP+ovnaSC78=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1CQ3VJsQiO7mOfIPbHAPwesm3SB/ITY8Xq3kn4cE8Tw=; b=NCbjeEYWVYr08jl36F5tlda5JU
 ks5GMDQi+hbbrgiPH2eYnEuWF8Lr2Fz4kyhP8pVhHaOY+7c58cm6Cn+tLyFd3T7nQflvltHZUSJzj
 AoUfM+LbAryAXspQzdKUqOJuVuBkpn0Wk8K+x8UnrKM9c5nh3PtQJ5aaWjcCyRNMjpZM=;
Received: from mail-wm1-f53.google.com ([209.85.128.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tBxdr-0006ud-1A for kgdb-bugreport@lists.sourceforge.net;
 Fri, 15 Nov 2024 14:49:48 +0000
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-432d86a3085so16872345e9.2
 for <kgdb-bugreport@lists.sourceforge.net>;
 Fri, 15 Nov 2024 06:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731682175; x=1732286975; darn=lists.sourceforge.net;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=1CQ3VJsQiO7mOfIPbHAPwesm3SB/ITY8Xq3kn4cE8Tw=;
 b=p2kXY7///FMNdjYhcGk/ngcFzOlg/DQUkyW6BcpKHgrN/Uqu1y1AjymYT1u/bhEfx4
 QxKY0Lo4tqa63Gi5PxCqF8F8y2Ptd1wcnp7b6GxoiIiQPILwl+NrgOFzlsDPsPO74Z++
 9jr+AVdwVp4UCxiXMjV1AsRHNJgXP9eyB83LZxcLDCJLEd2vWqiCtkHaFDxiLXJTff/q
 9VzoIkGUno8KfL+mQ6lozph9c2HSflUH3mGIl3WcANQyGWru1qdm8u1bUTGYiAjuEHeV
 wzdoEjGlyiZ1Dv+AnAYzazl7Yz1Wyc22GXAqIxh+jCzbFEVUNLENjCa59Sz0XaApsLky
 jWhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731682175; x=1732286975;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1CQ3VJsQiO7mOfIPbHAPwesm3SB/ITY8Xq3kn4cE8Tw=;
 b=YVYuYcdEL9p/S8zcg37HcanrCCG9649s77Ij+Fiuiw6oDIcO95a9+4UwfPSgk6po7M
 yO25RnYvq3o+Ak5/h+Wh/9ybMVHccUOfJt4wGt1gabPXh2xBV57Z5eJIWJsLxeiH92yv
 PZSxCPSj3dNH6Nlj9EJ5NYel//32i6v1nga6LoL+o67OHDzGtukrba2UoG9u3lnGIBqw
 nuIhcLVSBB7azoWj9uiTFwh5mmhPJuRWZqGFsbpJdD3cvwcy6cATMSg9BxhB7+NryEnf
 4fYNFAEBt6zxGSd+6udee7OsW07R4HBU6CFFGE2w2O3EJYIJWTIxZF/2CAxOu+bQ7FXa
 x4BQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpJY3KTUaNIf3diMLrJ1f5CFWZyAu9whOstAGeE7SUKdcId0hy7K7hVH85CBTrsdfqxJO4VQo1APFFfj7RLA==@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzoRmIHOCy5C5mEgMkkk5ygKK40IE3QUajv5WQSVUni+eRXOzbW
 9eLFWV6DH4I05L6a+XhuapYH6WRmpBfYD3LXEYVXi5YaOcswgeE94rfLGM1f37g=
X-Google-Smtp-Source: AGHT+IEZTRw0z2rsXoSRrmHzajz/Ttj2huRza2LtauItrrsM2B9+avISdV6Iv4/xXAH3qIK4xepK7w==
X-Received: by 2002:a05:600c:5487:b0:431:44fe:fd9f with SMTP id
 5b1f17b1804b1-432df78a529mr20763285e9.23.1731682175469; 
 Fri, 15 Nov 2024 06:49:35 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3821ae1685csm4664066f8f.83.2024.11.15.06.49.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Nov 2024 06:49:35 -0800 (PST)
Date: Fri, 15 Nov 2024 14:49:33 +0000
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Doug Anderson <dianders@chromium.org>
Message-ID: <20241115144933.GB4408@aspen.lan>
References: <Zy093jVKPs9gSVx2@telecaster>
 <CAD=FV=UZKZ_RL73+JLjeW2FmAfifSyXqLV3M30XzmJSPE9Trzw@mail.gmail.com>
 <Zy1lyACVnZK4xwuW@telecaster>
 <CAD=FV=U2eiG1TuTq48VL+kNCxN6qp_ZcDk3o_6p3B_ENOspQ9Q@mail.gmail.com>
 <Zy45mCCGZ9sHsXTT@telecaster>
 <CAD=FV=WN5Nzjs2KowMbTij8CZ+T_eZxJ5rLdyyBDk-1H_Dj3cg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=WN5Nzjs2KowMbTij8CZ+T_eZxJ5rLdyyBDk-1H_Dj3cg@mail.gmail.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Fri, Nov 08, 2024 at 09:37:32AM -0800, Doug Anderson wrote:
    > Hi, > > On Fri, Nov 8, 2024 at 8:17 AM Omar Sandoval <osandov@osandov.com>
    wrote: > > > > On Fri, Nov 08, 2024 at 07:31:19AM -0800, D [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.128.53 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.128.53 listed in sa-accredit.habeas.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.128.53 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.7 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.53 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1tBxdr-0006ud-1A
Subject: Re: [Kgdb-bugreport] kgdb replacing newline with CRLF in custom
 query response
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
 Stephen Brennan <stephen.s.brennan@oracle.com>, Amal Raj T <amalrajt@meta.com>,
 linux-serial@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>,
 Omar Sandoval <osandov@osandov.com>, linux-debuggers@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: kgdb-bugreport-bounces@lists.sourceforge.net

T24gRnJpLCBOb3YgMDgsIDIwMjQgYXQgMDk6Mzc6MzJBTSAtMDgwMCwgRG91ZyBBbmRlcnNvbiB3
cm90ZToKPiBIaSwKPgo+IE9uIEZyaSwgTm92IDgsIDIwMjQgYXQgODoxN+KAr0FNIE9tYXIgU2Fu
ZG92YWwgPG9zYW5kb3ZAb3NhbmRvdi5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIEZyaSwgTm92IDA4
LCAyMDI0IGF0IDA3OjMxOjE5QU0gLTA4MDAsIERvdWcgQW5kZXJzb24gd3JvdGU6Cj4gPiA+IEhp
LAo+ID4gPgo+ID4gPiBPbiBUaHUsIE5vdiA3LCAyMDI0IGF0IDU6MTPigK9QTSBPbWFyIFNhbmRv
dmFsIDxvc2FuZG92QG9zYW5kb3YuY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9uIFRodSwg
Tm92IDA3LCAyMDI0IGF0IDA1OjA4OjU4UE0gLTA4MDAsIERvdWcgQW5kZXJzb24gd3JvdGU6Cj4g
PiA+ID4gPiBIaSwKPiA+ID4gPiA+Cj4gPiA+ID4gPiBPbiBUaHUsIE5vdiA3LCAyMDI0IGF0IDI6
MjPigK9QTSBPbWFyIFNhbmRvdmFsIDxvc2FuZG92QG9zYW5kb3YuY29tPiB3cm90ZToKPiA+ID4g
PiA+ID4KPiA+ID4gPiA+ID4gSGkgZXZlcnlvbmUsCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEFt
YWwgaXMgd29ya2luZyBvbiBhZGRpbmcgYSBjdXN0b20gcXVlcnkgcGFja2V0IHRvIGtnZGIgZm9y
IGdldHRpbmcgdGhlCj4gPiA+ID4gPiA+IGtlcm5lbCdzIHZtY29yZWluZm8uIFRoZSByYXRpb25h
bGUgYW5kIGRldGFpbHMgYXJlIGF2YWlsYWJsZSBoZXJlOgo+ID4gPiA+ID4gPiBodHRwczovL2dp
dGh1Yi5jb20vb3NhbmRvdi9kcmduL3dpa2kvR0RCLVJlbW90ZS1Qcm90b2NvbC1wcm9wb3NhbDot
bGludXgudm1jb3JlaW5mby1xdWVyeS1wYWNrZXQKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gdm1j
b3JlaW5mbyBpcyBhYm91dCAza0IsIHNvIHdlIHdlcmUgaG9waW5nIHRvIGF2b2lkIGhleC1lbmNv
ZGluZyB0aGUKPiA+ID4gPiA+ID4gcmVzcG9uc2UgYW5kIGRvdWJsaW5nIHRoZSB0aW1lIGl0IHRh
a2VzIHRvIHRyYW5zbWl0IG92ZXIgYSBzbG93IHNlcmlhbAo+ID4gPiA+ID4gPiBjb25uZWN0aW9u
LiBJbnN0ZWFkLCB3ZSB3ZXJlIGhvcGluZyB0byB1c2UgdGhlIGVzY2FwZWQgYmluYXJ5IGZvcm1h
dCwKPiA+ID4gPiA+ID4gd2hpY2ggZXNjYXBlcyB0aGUgY2hhcmFjdGVycyAjJH0qIGFuZCBsZWF2
ZXMgb3RoZXIgYnl0ZXMgdW50b3VjaGVkLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBXZSByYW4g
aW50byBhIHByb2JsZW0sIHRob3VnaDogdm1jb3JlaW5mbyBjb250YWlucyBuZXdsaW5lIGNoYXJh
Y3RlcnMsCj4gPiA+ID4gPiA+IHdoaWNoIHRoZSBzZXJpYWwgY29yZSByZXBsYWNlcyB3aXRoIENS
TEY7IHNlZSBjb21taXQgYzdkNDRhMDJhYzYwCj4gPiA+ID4gPiA+ICgic2VyaWFsX2NvcmU6IENv
bW1vbmFsaXplIGNybGYgd2hlbiB3b3JraW5nIHcvIGEgbm9uIG9wZW4gY29uc29sZQo+ID4gPiA+
ID4gPiBwb3J0IikuCj4gPiA+ID4gPgo+ID4gPiA+ID4gRldJVywgdGhlIHByb2JsZW0gcHJlZGF0
ZXMgdGhhdCBjb21taXQsIGJ1dCB0aGF0IGNvbW1pdCBhdCBsZWFzdCBtb3ZlZAo+ID4gPiA+ID4g
aXQgdG8gYmUgc29tZXBsYWNlIGNvbW1vbi4gQmVmb3JlIHRoYXQgc29tZSBzZXJpYWwgZHJpdmVy
cyB3ZXJlCj4gPiA+ID4gPiBoYXJkY29kaW5nIGl0Li4uIDstKQo+ID4gPiA+ID4KPiA+ID4gPiA+
Cj4gPiA+ID4gPiA+IFRoaXMgZWZmZWN0aXZlbHkgY29ycnVwdHMgdGhlIGRhdGEgYW5kIGNhdXNl
cyBhIGNoZWNrc3VtCj4gPiA+ID4gPiA+IG1pc21hdGNoLgo+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiBXZSdkIGxvdmUgc29tZSBpbnB1dCBvbiBob3cgdG8gd29yayBhcm91bmQgdGhpcywgZXNwZWNp
YWxseSBmcm9tIHRoZQo+ID4gPiA+ID4gPiBrZ2RiIG1haW50YWluZXJzLiBIZXJlIGFyZSBhIGZl
dyBvcHRpb25zLCBpbiBkZXNjZW5kaW5nIG9yZGVyIG9mIG15Cj4gPiA+ID4gPiA+IHByZWZlcmVu
Y2U6Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IDEuIERpc2FibGUgdGhlIExGIC0+IENSTEYgcmVw
bGFjZW1lbnQgd2hpbGUgc2VuZGluZyBiaW5hcnkgZGF0YS4KPiA+ID4gPiA+ID4gMi4gRXNjYXBl
IHRoZSBuZXdsaW5lcyB1c2luZyBzb21lIG90aGVyIGN1c3RvbSBzY2hlbWUuCj4gPiA+ID4gPiA+
IDMuIEdpdmUgdXAgYW5kIGhleC1lbmNvZGUgdGhlIHJlc3BvbnNlLgo+ID4gPiA+ID4KPiA+ID4g
PiA+IEkgaGF2ZW4ndCB0cmllZCBwcm90b3R5cGluZyBpdCwgYnV0IHdoYXQgYWJvdXQgbW92aW5n
IHRoZSBMUiAtPiBDUkxGCj4gPiA+ID4gPiBjb2RlIHRvIGtkYl9tc2dfd3JpdGUoKS4gSXQgd291
bGQgYmUgcmVhbGx5IGVhc3kgdG8gZG8gdGhpcyBpbiB0aGUKPiA+ID4gPiA+IGNhc2Ugd2hlcmUg
d2UncmUgZG9pbmcgImRiZ19pb19vcHMtPndyaXRlX2NoYXIoKSIgc2luY2Ugd2UncmUgYWxyZWFk
eQo+ID4gPiA+ID4gcHJvY2Vzc2luZyBjaGFyYWN0ZXIgYXQgYSB0aW1lLiBJdCB3b3VsZCBiZSBo
YXJkZXIgdG8gZG8gdGhpcyB3aGVuCj4gPiA+ID4gPiBhbHNvIHNlbmRpbmcgdGhlIG91dHB1dCB0
byB0aGUgdmFyaW91cyBjb25zb2xlLCBidXQgbWF5IG5vdCBfdG9vXwo+ID4gPiA+ID4gaGFyZD8g
WW91IGNvdWxkIGxvb3Agc2VhcmNoaW5nIGZvciAiXG4iIGFuZCBzZW5kIGFsbCB0aGUgY2hhcmFj
dGVycwo+ID4gPiA+ID4gYmVmb3JlIHRoZSAiXG4iLCB0aGVuIHNlbmQgYSAiXHIiLCB0aGVuIHNl
bmQgdGhlICJcbiIgYW5kIGFsbCB0aGUKPiA+ID4gPiA+IGNoYXJhY3RlcnMgdXAgdG8gdGhlIG5l
eHQgIlxuIi4KPgo+IEFjdHVhbGx5LCBsb29raW5nIGF0IHRoaXMgYWdhaW4sIEkgd29uZGVyIGlm
IHdlIGV2ZW4gbmVlZCB0byBkbyBhbnkKPiB0cmFuc2Zvcm1hdGlvbiBiZWZvcmUgc2VuZGluZyBp
dCB0byB0aGUgdmFyaW91cyBjb25zb2xlcy4gUHJvYmFibHkKPiBub3QuIEkgdGhpbmsgaXQncyBf
anVzdF8gdGhlIHdyaXRlX2NoYXIoKSBwYXRoIHRoYXQgbmVlZGVkIGl0Pwo+Cj4KPiA+ID4gPiA+
IElmIHlvdSBkaWQgdGhpcyB0aGVuIHlvdSdkIGxvc2UgdGhlICJcbiIgdG8gIlxyXG4iIGNvbWJp
bmF0aW9uIGluIHRoZQo+ID4gPiA+ID4gZ2RiIHN0dWIsIGJ1dCBfcHJvYmFibHlfIHRoYXQgZG9l
c24ndCBtYXR0ZXI/Cj4gPiA+ID4KPiA+ID4gPiBUaGF0IHNvdW5kcyByZWFzb25hYmxlLiBJIHdh
cyBjb25jZXJuZWQgd2hldGhlciB0aGlzIHdvdWxkIGFmZmVjdAo+ID4gPiA+IGFueXRoaW5nIGVs
c2UgdXNpbmcgdGhlIC0+cG9sbF9wdXRfY2hhcigpIHR0eSBvcGVyYXRpb24sIGJ1dCBrZ2RiIHNl
ZW1zCj4gPiA+ID4gdG8gYmUgdGhlIG9ubHkgdXNlciwgZG9lcyB0aGF0IHNvdW5kIHJpZ2h0Pwo+
ID4gPgo+ID4gPiBSaWdodC4gQXMgZmFyIGFzIEkgY2FuIHRlbGwsIGtnZGIgaXMgdGhlIG9ubHkg
dXNlciBvZiBwb2xsX3B1dF9jaGFyKCkuCj4gPgo+ID4gQWgsIG9uZSBvdGhlciBjb25jZXJuLCB0
aG91Z2g6IG9ubHkgdWFydF9wb2xsX3B1dF9jaGFyKCkgZG9lcyB0aGUgQ1JMRgo+ID4gcmVwbGFj
ZW1lbnQsIGJ1dCB0aGVyZSBhcmUgb3RoZXIgdHR5X29wZXJhdGlvbnMgdGhhdCBkb24ndCwgbGlr
ZQo+ID4gaHZjX3BvbGxfcHV0X2NoYXIoKS4gU28gaWYgd2UgbW92ZSB0aGF0IHRvIGtkYl9tc2df
d3JpdGUoKSwgdGhlbiB3ZSdsbAo+ID4gYmUgYWRkaW5nIGV4dHJhICdccicgZm9yIG90aGVyIHR0
eSB0eXBlcy4gV291bGQgdGhhdCBiZSBhIHByb2JsZW0/Cj4KPiBJIGhvbmVzdGx5IGRvbid0IGtu
b3cuIEkgZ3Vlc3MgYWxzbyBpdCBjYW4gYmUgbm90ZWQgdGhhdCBpZiB3ZSBkbyBpdAo+IGluIGtk
Yl9tc2dfd3JpdGUoKSB0aGVuIHRoZSB3cml0ZV9jaGFyKCkgcGF0aCBjYW4gZXZlbiB0YWtlIHVz
IHRvCj4gcGxhY2VzIHRoYXQgZG9uJ3QgaW52b2tlIHVhcnRfcG9sbF9wdXRfY2hhcigpLiBGb3Ig
aW5zdGFuY2UKPiAiZWhjaS1kYmdwLmMiIHJlZ2lzdGVycyBpdHMgb3duIGlvX21vZHVsZS4uLgo+
Cj4gQmxlaC4gSXQgX3Byb2JhYmx5XyB3b3VsZG4ndCBiZSBhIGJpZyBkZWFsIHRvIGRvIHRoZSBM
RiAtPiBDUkxGIGZvcgo+IGFsbCB0aGVzZSwgYnV0IEkgZG9uJ3Qga25vdyBmb3Igc3VyZS4gSSBn
dWVzcyB3b3JzdCBjYXNlIHlvdSBjb3VsZCBhZGQKPiBzb21lIGZsYWcgaW4gdGhlICJkYmdfaW9f
b3BzIiBhbmQgZmlndXJlIG91dCBob3cgdG8gc2V0IGl0IGp1c3QgZm9yCj4gVUFSVHM/CgpJIGZp
bmQgbXlzZWxmIGluIGEgc2ltaWxhciBwb3NpdGlvbiB0byBEb3VnLgoKSXQgc291bmRzIHJlYXNv
bmFibGUgdG8gbW92ZSB0aGUgQ1Igc3ludGhlc2lzIGludG8ga2RiX21zZ193cml0ZSgpIGJ1dCBJ
CmFsc28gYW0gbm90IGNlcnRhaW4gdGhlIG90aGVyIHBvbGxpbmcgYmFja2VuZHMgd2lsbCBoYW5k
bGUgdGhpcyBjb3JyZWN0bHkuCgpIb3dldmVyIEkgZGlkIGFwcGx5IHRoZSBmb2xsb3dpbmcgcGF0
Y2ggYW5kIHJ1biBhIGZldyB0ZXN0cyBhbmQgaXQgYWxsCmxvb2tzIGdvb2QuIFNwZWNpZmljYWxs
eSB0aGVyZSBhcmUgbm8gcmVncmVzc2lvbnMgZnJvbSB0aGUga2dkYiB0ZXN0CnN1aXRlIGFsdGhv
dWdoIHRoYXQncyB1bnN1cnByaXNpbmcgc2luY2UgdGhhdCBzdWl0ZSBleGNsdXNpdmVseSB0ZXN0
cwp0aGUgc2VyaWFsIHBvcnQuIEkgYWxzbyBmaXJlZCB1cCB0aGUga2RiLGttcyBwb2xsaW5nIGJh
Y2tlbmRzIG9uIHg4NgphbmQgdmVyaWZpZWQgdGhhdCBJIGRpZG4ndCBnZXQgZG91YmxlIGxpbmUg
ZmVlZHMgaW4ga2RiIChJIGRpZCBub3QpLgoKVGhhdCBtZWFucyBJJ2QgY2VydGFpbmx5IGFjY2Vw
dCBwYXRjaGVzIGJhc2VkIG9uIERvdWcncyBpZGVhIGFuZCBpZiBpdApwcm92ZXMgbGF0ZXIgdGhh
dCB3ZSBoYXZlIHRvIHJldmVydCBhbmQgYWRkIGEgbmV3IGRiZ19pb19vcHMgcG9pbnRlciB0bwpz
d2l0Y2ggdGhlIGhhbmRsZXIgYmV0d2VlbiBiaW5hcnkgYW5kIGFzY2lpIG1vZGVzIHRoZW4gc28g
YmUgaXQhCgoKRGFuaWVsLgoKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3R0eS9zZXJpYWwvc2VyaWFs
X2NvcmUuYyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9zZXJpYWxfY29yZS5jCmluZGV4IGQ5NGQ3M2U0
NWZiNmQuLmZmZjEyNjljNTU0OTggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvdHR5L3NlcmlhbC9zZXJp
YWxfY29yZS5jCisrKyBiL2RyaXZlcnMvdHR5L3NlcmlhbC9zZXJpYWxfY29yZS5jCkBAIC0yNzM4
LDggKzI3MzgsMTAgQEAgc3RhdGljIHZvaWQgdWFydF9wb2xsX3B1dF9jaGFyKHN0cnVjdCB0dHlf
ZHJpdmVyICpkcml2ZXIsIGludCBsaW5lLCBjaGFyIGNoKQogCWlmICghcG9ydCkKIAkJcmV0dXJu
OwoKKyNpZiAwCiAJaWYgKGNoID09ICdcbicpCiAJCXBvcnQtPm9wcy0+cG9sbF9wdXRfY2hhcihw
b3J0LCAnXHInKTsKKyNlbmRpZgogCXBvcnQtPm9wcy0+cG9sbF9wdXRfY2hhcihwb3J0LCBjaCk7
CiAJdWFydF9wb3J0X2RlcmVmKHBvcnQpOwogfQpkaWZmIC0tZ2l0IGEva2VybmVsL2RlYnVnL2tk
Yi9rZGJfaW8uYyBiL2tlcm5lbC9kZWJ1Zy9rZGIva2RiX2lvLmMKaW5kZXggNmE3N2YxYzc3OWM0
Yy4uNDNhN2M4YWQ3NDFhYyAxMDA2NDQKLS0tIGEva2VybmVsL2RlYnVnL2tkYi9rZGJfaW8uYwor
KysgYi9rZXJuZWwvZGVidWcva2RiL2tkYl9pby5jCkBAIC01NzIsNiArNTcyLDggQEAgc3RhdGlj
IHZvaWQga2RiX21zZ193cml0ZShjb25zdCBjaGFyICptc2csIGludCBtc2dfbGVuKQogCWxlbiA9
IG1zZ19sZW47CgogCXdoaWxlIChsZW4tLSkgeworCQlpZiAoKmNwID09ICdcbicpCisJCQlkYmdf
aW9fb3BzLT53cml0ZV9jaGFyKCdccicpOwogCQlkYmdfaW9fb3BzLT53cml0ZV9jaGFyKCpjcCk7
CiAJCWNwKys7CiAJfQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCktnZGItYnVncmVwb3J0IG1haWxpbmcgbGlzdApLZ2RiLWJ1Z3JlcG9ydEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8va2dkYi1idWdyZXBvcnQK
